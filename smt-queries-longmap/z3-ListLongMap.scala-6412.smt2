; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82270 () Bool)

(assert start!82270)

(declare-fun b_free!18543 () Bool)

(declare-fun b_next!18543 () Bool)

(assert (=> start!82270 (= b_free!18543 (not b_next!18543))))

(declare-fun tp!64589 () Bool)

(declare-fun b_and!30031 () Bool)

(assert (=> start!82270 (= tp!64589 b_and!30031)))

(declare-fun b!959032 () Bool)

(declare-fun res!641950 () Bool)

(declare-fun e!540645 () Bool)

(assert (=> b!959032 (=> (not res!641950) (not e!540645))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58595 0))(
  ( (array!58596 (arr!28171 (Array (_ BitVec 32) (_ BitVec 64))) (size!28650 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58595)

(declare-datatypes ((V!33315 0))(
  ( (V!33316 (val!10675 Int)) )
))
(declare-datatypes ((ValueCell!10143 0))(
  ( (ValueCellFull!10143 (v!13232 V!33315)) (EmptyCell!10143) )
))
(declare-datatypes ((array!58597 0))(
  ( (array!58598 (arr!28172 (Array (_ BitVec 32) ValueCell!10143)) (size!28651 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58597)

(assert (=> b!959032 (= res!641950 (and (= (size!28651 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28650 _keys!1668) (size!28651 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959033 () Bool)

(declare-fun e!540641 () Bool)

(declare-fun tp_is_empty!21249 () Bool)

(assert (=> b!959033 (= e!540641 tp_is_empty!21249)))

(declare-fun mapNonEmpty!33853 () Bool)

(declare-fun mapRes!33853 () Bool)

(declare-fun tp!64590 () Bool)

(assert (=> mapNonEmpty!33853 (= mapRes!33853 (and tp!64590 e!540641))))

(declare-fun mapKey!33853 () (_ BitVec 32))

(declare-fun mapValue!33853 () ValueCell!10143)

(declare-fun mapRest!33853 () (Array (_ BitVec 32) ValueCell!10143))

(assert (=> mapNonEmpty!33853 (= (arr!28172 _values!1386) (store mapRest!33853 mapKey!33853 mapValue!33853))))

(declare-fun b!959034 () Bool)

(declare-fun e!540644 () Bool)

(assert (=> b!959034 (= e!540644 tp_is_empty!21249)))

(declare-fun b!959036 () Bool)

(declare-fun e!540643 () Bool)

(assert (=> b!959036 (= e!540643 (and e!540644 mapRes!33853))))

(declare-fun condMapEmpty!33853 () Bool)

(declare-fun mapDefault!33853 () ValueCell!10143)

(assert (=> b!959036 (= condMapEmpty!33853 (= (arr!28172 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10143)) mapDefault!33853)))))

(declare-fun b!959037 () Bool)

(declare-fun res!641951 () Bool)

(assert (=> b!959037 (=> (not res!641951) (not e!540645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58595 (_ BitVec 32)) Bool)

(assert (=> b!959037 (= res!641951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959038 () Bool)

(declare-fun res!641949 () Bool)

(assert (=> b!959038 (=> (not res!641949) (not e!540645))))

(declare-datatypes ((List!19585 0))(
  ( (Nil!19582) (Cons!19581 (h!20743 (_ BitVec 64)) (t!27948 List!19585)) )
))
(declare-fun arrayNoDuplicates!0 (array!58595 (_ BitVec 32) List!19585) Bool)

(assert (=> b!959038 (= res!641949 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19582))))

(declare-fun mapIsEmpty!33853 () Bool)

(assert (=> mapIsEmpty!33853 mapRes!33853))

(declare-fun b!959039 () Bool)

(declare-fun res!641948 () Bool)

(assert (=> b!959039 (=> (not res!641948) (not e!540645))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959039 (= res!641948 (validKeyInArray!0 (select (arr!28171 _keys!1668) i!793)))))

(declare-fun b!959040 () Bool)

(declare-fun res!641953 () Bool)

(assert (=> b!959040 (=> (not res!641953) (not e!540645))))

(declare-fun minValue!1328 () V!33315)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33315)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13766 0))(
  ( (tuple2!13767 (_1!6894 (_ BitVec 64)) (_2!6894 V!33315)) )
))
(declare-datatypes ((List!19586 0))(
  ( (Nil!19583) (Cons!19582 (h!20744 tuple2!13766) (t!27949 List!19586)) )
))
(declare-datatypes ((ListLongMap!12463 0))(
  ( (ListLongMap!12464 (toList!6247 List!19586)) )
))
(declare-fun contains!5348 (ListLongMap!12463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3480 (array!58595 array!58597 (_ BitVec 32) (_ BitVec 32) V!33315 V!33315 (_ BitVec 32) Int) ListLongMap!12463)

(assert (=> b!959040 (= res!641953 (contains!5348 (getCurrentListMap!3480 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28171 _keys!1668) i!793)))))

(declare-fun b!959041 () Bool)

(assert (=> b!959041 (= e!540645 (not true))))

(assert (=> b!959041 (contains!5348 (getCurrentListMap!3480 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28171 _keys!1668) i!793))))

(declare-datatypes ((Unit!32169 0))(
  ( (Unit!32170) )
))
(declare-fun lt!430506 () Unit!32169)

(declare-fun lemmaInListMapFromThenInFromSmaller!6 (array!58595 array!58597 (_ BitVec 32) (_ BitVec 32) V!33315 V!33315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32169)

(assert (=> b!959041 (= lt!430506 (lemmaInListMapFromThenInFromSmaller!6 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun res!641952 () Bool)

(assert (=> start!82270 (=> (not res!641952) (not e!540645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82270 (= res!641952 (validMask!0 mask!2088))))

(assert (=> start!82270 e!540645))

(assert (=> start!82270 true))

(assert (=> start!82270 tp_is_empty!21249))

(declare-fun array_inv!21841 (array!58595) Bool)

(assert (=> start!82270 (array_inv!21841 _keys!1668)))

(declare-fun array_inv!21842 (array!58597) Bool)

(assert (=> start!82270 (and (array_inv!21842 _values!1386) e!540643)))

(assert (=> start!82270 tp!64589))

(declare-fun b!959035 () Bool)

(declare-fun res!641954 () Bool)

(assert (=> b!959035 (=> (not res!641954) (not e!540645))))

(assert (=> b!959035 (= res!641954 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28650 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28650 _keys!1668))))))

(assert (= (and start!82270 res!641952) b!959032))

(assert (= (and b!959032 res!641950) b!959037))

(assert (= (and b!959037 res!641951) b!959038))

(assert (= (and b!959038 res!641949) b!959035))

(assert (= (and b!959035 res!641954) b!959039))

(assert (= (and b!959039 res!641948) b!959040))

(assert (= (and b!959040 res!641953) b!959041))

(assert (= (and b!959036 condMapEmpty!33853) mapIsEmpty!33853))

(assert (= (and b!959036 (not condMapEmpty!33853)) mapNonEmpty!33853))

(get-info :version)

(assert (= (and mapNonEmpty!33853 ((_ is ValueCellFull!10143) mapValue!33853)) b!959033))

(assert (= (and b!959036 ((_ is ValueCellFull!10143) mapDefault!33853)) b!959034))

(assert (= start!82270 b!959036))

(declare-fun m!889579 () Bool)

(assert (=> mapNonEmpty!33853 m!889579))

(declare-fun m!889581 () Bool)

(assert (=> b!959038 m!889581))

(declare-fun m!889583 () Bool)

(assert (=> b!959041 m!889583))

(declare-fun m!889585 () Bool)

(assert (=> b!959041 m!889585))

(assert (=> b!959041 m!889583))

(assert (=> b!959041 m!889585))

(declare-fun m!889587 () Bool)

(assert (=> b!959041 m!889587))

(declare-fun m!889589 () Bool)

(assert (=> b!959041 m!889589))

(declare-fun m!889591 () Bool)

(assert (=> start!82270 m!889591))

(declare-fun m!889593 () Bool)

(assert (=> start!82270 m!889593))

(declare-fun m!889595 () Bool)

(assert (=> start!82270 m!889595))

(declare-fun m!889597 () Bool)

(assert (=> b!959037 m!889597))

(assert (=> b!959039 m!889585))

(assert (=> b!959039 m!889585))

(declare-fun m!889599 () Bool)

(assert (=> b!959039 m!889599))

(declare-fun m!889601 () Bool)

(assert (=> b!959040 m!889601))

(assert (=> b!959040 m!889585))

(assert (=> b!959040 m!889601))

(assert (=> b!959040 m!889585))

(declare-fun m!889603 () Bool)

(assert (=> b!959040 m!889603))

(check-sat (not b!959040) (not b_next!18543) tp_is_empty!21249 (not b!959039) (not b!959041) (not b!959037) (not start!82270) (not mapNonEmpty!33853) b_and!30031 (not b!959038))
(check-sat b_and!30031 (not b_next!18543))

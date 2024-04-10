; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82300 () Bool)

(assert start!82300)

(declare-fun b_free!18573 () Bool)

(declare-fun b_next!18573 () Bool)

(assert (=> start!82300 (= b_free!18573 (not b_next!18573))))

(declare-fun tp!64680 () Bool)

(declare-fun b_and!30061 () Bool)

(assert (=> start!82300 (= tp!64680 b_and!30061)))

(declare-fun b!959482 () Bool)

(declare-fun e!540869 () Bool)

(declare-fun tp_is_empty!21279 () Bool)

(assert (=> b!959482 (= e!540869 tp_is_empty!21279)))

(declare-fun b!959483 () Bool)

(declare-fun res!642265 () Bool)

(declare-fun e!540868 () Bool)

(assert (=> b!959483 (=> (not res!642265) (not e!540868))))

(declare-datatypes ((array!58651 0))(
  ( (array!58652 (arr!28199 (Array (_ BitVec 32) (_ BitVec 64))) (size!28678 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58651)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959483 (= res!642265 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28678 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28678 _keys!1668))))))

(declare-fun b!959484 () Bool)

(declare-fun res!642264 () Bool)

(assert (=> b!959484 (=> (not res!642264) (not e!540868))))

(declare-datatypes ((List!19610 0))(
  ( (Nil!19607) (Cons!19606 (h!20768 (_ BitVec 64)) (t!27973 List!19610)) )
))
(declare-fun arrayNoDuplicates!0 (array!58651 (_ BitVec 32) List!19610) Bool)

(assert (=> b!959484 (= res!642264 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19607))))

(declare-fun res!642266 () Bool)

(assert (=> start!82300 (=> (not res!642266) (not e!540868))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82300 (= res!642266 (validMask!0 mask!2088))))

(assert (=> start!82300 e!540868))

(assert (=> start!82300 true))

(assert (=> start!82300 tp_is_empty!21279))

(declare-fun array_inv!21861 (array!58651) Bool)

(assert (=> start!82300 (array_inv!21861 _keys!1668)))

(declare-datatypes ((V!33355 0))(
  ( (V!33356 (val!10690 Int)) )
))
(declare-datatypes ((ValueCell!10158 0))(
  ( (ValueCellFull!10158 (v!13247 V!33355)) (EmptyCell!10158) )
))
(declare-datatypes ((array!58653 0))(
  ( (array!58654 (arr!28200 (Array (_ BitVec 32) ValueCell!10158)) (size!28679 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58653)

(declare-fun e!540867 () Bool)

(declare-fun array_inv!21862 (array!58653) Bool)

(assert (=> start!82300 (and (array_inv!21862 _values!1386) e!540867)))

(assert (=> start!82300 tp!64680))

(declare-fun b!959485 () Bool)

(declare-fun mapRes!33898 () Bool)

(assert (=> b!959485 (= e!540867 (and e!540869 mapRes!33898))))

(declare-fun condMapEmpty!33898 () Bool)

(declare-fun mapDefault!33898 () ValueCell!10158)

(assert (=> b!959485 (= condMapEmpty!33898 (= (arr!28200 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10158)) mapDefault!33898)))))

(declare-fun mapNonEmpty!33898 () Bool)

(declare-fun tp!64679 () Bool)

(declare-fun e!540866 () Bool)

(assert (=> mapNonEmpty!33898 (= mapRes!33898 (and tp!64679 e!540866))))

(declare-fun mapRest!33898 () (Array (_ BitVec 32) ValueCell!10158))

(declare-fun mapKey!33898 () (_ BitVec 32))

(declare-fun mapValue!33898 () ValueCell!10158)

(assert (=> mapNonEmpty!33898 (= (arr!28200 _values!1386) (store mapRest!33898 mapKey!33898 mapValue!33898))))

(declare-fun b!959486 () Bool)

(assert (=> b!959486 (= e!540866 tp_is_empty!21279)))

(declare-fun b!959487 () Bool)

(declare-fun res!642269 () Bool)

(assert (=> b!959487 (=> (not res!642269) (not e!540868))))

(declare-fun minValue!1328 () V!33355)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33355)

(declare-datatypes ((tuple2!13792 0))(
  ( (tuple2!13793 (_1!6907 (_ BitVec 64)) (_2!6907 V!33355)) )
))
(declare-datatypes ((List!19611 0))(
  ( (Nil!19608) (Cons!19607 (h!20769 tuple2!13792) (t!27974 List!19611)) )
))
(declare-datatypes ((ListLongMap!12489 0))(
  ( (ListLongMap!12490 (toList!6260 List!19611)) )
))
(declare-fun contains!5361 (ListLongMap!12489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3493 (array!58651 array!58653 (_ BitVec 32) (_ BitVec 32) V!33355 V!33355 (_ BitVec 32) Int) ListLongMap!12489)

(assert (=> b!959487 (= res!642269 (contains!5361 (getCurrentListMap!3493 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28199 _keys!1668) i!793)))))

(declare-fun b!959488 () Bool)

(declare-fun res!642263 () Bool)

(assert (=> b!959488 (=> (not res!642263) (not e!540868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959488 (= res!642263 (validKeyInArray!0 (select (arr!28199 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33898 () Bool)

(assert (=> mapIsEmpty!33898 mapRes!33898))

(declare-fun b!959489 () Bool)

(declare-fun res!642268 () Bool)

(assert (=> b!959489 (=> (not res!642268) (not e!540868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58651 (_ BitVec 32)) Bool)

(assert (=> b!959489 (= res!642268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959490 () Bool)

(declare-fun res!642267 () Bool)

(assert (=> b!959490 (=> (not res!642267) (not e!540868))))

(assert (=> b!959490 (= res!642267 (and (= (size!28679 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28678 _keys!1668) (size!28679 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959491 () Bool)

(assert (=> b!959491 (= e!540868 (not true))))

(assert (=> b!959491 (contains!5361 (getCurrentListMap!3493 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28199 _keys!1668) i!793))))

(declare-datatypes ((Unit!32195 0))(
  ( (Unit!32196) )
))
(declare-fun lt!430551 () Unit!32195)

(declare-fun lemmaInListMapFromThenInFromSmaller!19 (array!58651 array!58653 (_ BitVec 32) (_ BitVec 32) V!33355 V!33355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32195)

(assert (=> b!959491 (= lt!430551 (lemmaInListMapFromThenInFromSmaller!19 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(assert (= (and start!82300 res!642266) b!959490))

(assert (= (and b!959490 res!642267) b!959489))

(assert (= (and b!959489 res!642268) b!959484))

(assert (= (and b!959484 res!642264) b!959483))

(assert (= (and b!959483 res!642265) b!959488))

(assert (= (and b!959488 res!642263) b!959487))

(assert (= (and b!959487 res!642269) b!959491))

(assert (= (and b!959485 condMapEmpty!33898) mapIsEmpty!33898))

(assert (= (and b!959485 (not condMapEmpty!33898)) mapNonEmpty!33898))

(get-info :version)

(assert (= (and mapNonEmpty!33898 ((_ is ValueCellFull!10158) mapValue!33898)) b!959486))

(assert (= (and b!959485 ((_ is ValueCellFull!10158) mapDefault!33898)) b!959482))

(assert (= start!82300 b!959485))

(declare-fun m!889969 () Bool)

(assert (=> b!959484 m!889969))

(declare-fun m!889971 () Bool)

(assert (=> b!959489 m!889971))

(declare-fun m!889973 () Bool)

(assert (=> b!959491 m!889973))

(declare-fun m!889975 () Bool)

(assert (=> b!959491 m!889975))

(assert (=> b!959491 m!889973))

(assert (=> b!959491 m!889975))

(declare-fun m!889977 () Bool)

(assert (=> b!959491 m!889977))

(declare-fun m!889979 () Bool)

(assert (=> b!959491 m!889979))

(declare-fun m!889981 () Bool)

(assert (=> b!959487 m!889981))

(assert (=> b!959487 m!889975))

(assert (=> b!959487 m!889981))

(assert (=> b!959487 m!889975))

(declare-fun m!889983 () Bool)

(assert (=> b!959487 m!889983))

(declare-fun m!889985 () Bool)

(assert (=> mapNonEmpty!33898 m!889985))

(declare-fun m!889987 () Bool)

(assert (=> start!82300 m!889987))

(declare-fun m!889989 () Bool)

(assert (=> start!82300 m!889989))

(declare-fun m!889991 () Bool)

(assert (=> start!82300 m!889991))

(assert (=> b!959488 m!889975))

(assert (=> b!959488 m!889975))

(declare-fun m!889993 () Bool)

(assert (=> b!959488 m!889993))

(check-sat tp_is_empty!21279 (not mapNonEmpty!33898) (not b!959487) (not b!959491) (not start!82300) (not b!959488) b_and!30061 (not b!959489) (not b!959484) (not b_next!18573))
(check-sat b_and!30061 (not b_next!18573))

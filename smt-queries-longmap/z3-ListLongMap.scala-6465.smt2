; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82632 () Bool)

(assert start!82632)

(declare-fun b_free!18765 () Bool)

(declare-fun b_next!18765 () Bool)

(assert (=> start!82632 (= b_free!18765 (not b_next!18765))))

(declare-fun tp!65414 () Bool)

(declare-fun b_and!30253 () Bool)

(assert (=> start!82632 (= tp!65414 b_and!30253)))

(declare-fun b!963195 () Bool)

(declare-fun e!543121 () Bool)

(declare-fun tp_is_empty!21567 () Bool)

(assert (=> b!963195 (= e!543121 tp_is_empty!21567)))

(declare-fun b!963196 () Bool)

(declare-fun e!543124 () Bool)

(assert (=> b!963196 (= e!543124 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33739 0))(
  ( (V!33740 (val!10834 Int)) )
))
(declare-datatypes ((ValueCell!10302 0))(
  ( (ValueCellFull!10302 (v!13392 V!33739)) (EmptyCell!10302) )
))
(declare-datatypes ((array!59229 0))(
  ( (array!59230 (arr!28483 (Array (_ BitVec 32) ValueCell!10302)) (size!28962 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59229)

(declare-datatypes ((array!59231 0))(
  ( (array!59232 (arr!28484 (Array (_ BitVec 32) (_ BitVec 64))) (size!28963 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59231)

(declare-fun minValue!1342 () V!33739)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33739)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13918 0))(
  ( (tuple2!13919 (_1!6970 (_ BitVec 64)) (_2!6970 V!33739)) )
))
(declare-datatypes ((List!19768 0))(
  ( (Nil!19765) (Cons!19764 (h!20926 tuple2!13918) (t!28131 List!19768)) )
))
(declare-datatypes ((ListLongMap!12615 0))(
  ( (ListLongMap!12616 (toList!6323 List!19768)) )
))
(declare-fun contains!5426 (ListLongMap!12615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3556 (array!59231 array!59229 (_ BitVec 32) (_ BitVec 32) V!33739 V!33739 (_ BitVec 32) Int) ListLongMap!12615)

(assert (=> b!963196 (contains!5426 (getCurrentListMap!3556 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28484 _keys!1686) i!803))))

(declare-datatypes ((Unit!32231 0))(
  ( (Unit!32232) )
))
(declare-fun lt!430951 () Unit!32231)

(declare-fun lemmaInListMapFromThenInFromMinusOne!10 (array!59231 array!59229 (_ BitVec 32) (_ BitVec 32) V!33739 V!33739 (_ BitVec 32) (_ BitVec 32) Int) Unit!32231)

(assert (=> b!963196 (= lt!430951 (lemmaInListMapFromThenInFromMinusOne!10 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963197 () Bool)

(declare-fun res!644619 () Bool)

(assert (=> b!963197 (=> (not res!644619) (not e!543124))))

(assert (=> b!963197 (= res!644619 (contains!5426 (getCurrentListMap!3556 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28484 _keys!1686) i!803)))))

(declare-fun b!963198 () Bool)

(declare-fun res!644620 () Bool)

(assert (=> b!963198 (=> (not res!644620) (not e!543124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59231 (_ BitVec 32)) Bool)

(assert (=> b!963198 (= res!644620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644622 () Bool)

(assert (=> start!82632 (=> (not res!644622) (not e!543124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82632 (= res!644622 (validMask!0 mask!2110))))

(assert (=> start!82632 e!543124))

(assert (=> start!82632 true))

(declare-fun e!543123 () Bool)

(declare-fun array_inv!22069 (array!59229) Bool)

(assert (=> start!82632 (and (array_inv!22069 _values!1400) e!543123)))

(declare-fun array_inv!22070 (array!59231) Bool)

(assert (=> start!82632 (array_inv!22070 _keys!1686)))

(assert (=> start!82632 tp!65414))

(assert (=> start!82632 tp_is_empty!21567))

(declare-fun mapIsEmpty!34345 () Bool)

(declare-fun mapRes!34345 () Bool)

(assert (=> mapIsEmpty!34345 mapRes!34345))

(declare-fun b!963199 () Bool)

(assert (=> b!963199 (= e!543123 (and e!543121 mapRes!34345))))

(declare-fun condMapEmpty!34345 () Bool)

(declare-fun mapDefault!34345 () ValueCell!10302)

(assert (=> b!963199 (= condMapEmpty!34345 (= (arr!28483 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10302)) mapDefault!34345)))))

(declare-fun b!963200 () Bool)

(declare-fun res!644617 () Bool)

(assert (=> b!963200 (=> (not res!644617) (not e!543124))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963200 (= res!644617 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28963 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28963 _keys!1686))))))

(declare-fun b!963201 () Bool)

(declare-fun res!644623 () Bool)

(assert (=> b!963201 (=> (not res!644623) (not e!543124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963201 (= res!644623 (validKeyInArray!0 (select (arr!28484 _keys!1686) i!803)))))

(declare-fun b!963202 () Bool)

(declare-fun res!644616 () Bool)

(assert (=> b!963202 (=> (not res!644616) (not e!543124))))

(assert (=> b!963202 (= res!644616 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963203 () Bool)

(declare-fun res!644621 () Bool)

(assert (=> b!963203 (=> (not res!644621) (not e!543124))))

(declare-datatypes ((List!19769 0))(
  ( (Nil!19766) (Cons!19765 (h!20927 (_ BitVec 64)) (t!28132 List!19769)) )
))
(declare-fun arrayNoDuplicates!0 (array!59231 (_ BitVec 32) List!19769) Bool)

(assert (=> b!963203 (= res!644621 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19766))))

(declare-fun mapNonEmpty!34345 () Bool)

(declare-fun tp!65415 () Bool)

(declare-fun e!543125 () Bool)

(assert (=> mapNonEmpty!34345 (= mapRes!34345 (and tp!65415 e!543125))))

(declare-fun mapRest!34345 () (Array (_ BitVec 32) ValueCell!10302))

(declare-fun mapValue!34345 () ValueCell!10302)

(declare-fun mapKey!34345 () (_ BitVec 32))

(assert (=> mapNonEmpty!34345 (= (arr!28483 _values!1400) (store mapRest!34345 mapKey!34345 mapValue!34345))))

(declare-fun b!963204 () Bool)

(assert (=> b!963204 (= e!543125 tp_is_empty!21567)))

(declare-fun b!963205 () Bool)

(declare-fun res!644618 () Bool)

(assert (=> b!963205 (=> (not res!644618) (not e!543124))))

(assert (=> b!963205 (= res!644618 (and (= (size!28962 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28963 _keys!1686) (size!28962 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82632 res!644622) b!963205))

(assert (= (and b!963205 res!644618) b!963198))

(assert (= (and b!963198 res!644620) b!963203))

(assert (= (and b!963203 res!644621) b!963200))

(assert (= (and b!963200 res!644617) b!963201))

(assert (= (and b!963201 res!644623) b!963197))

(assert (= (and b!963197 res!644619) b!963202))

(assert (= (and b!963202 res!644616) b!963196))

(assert (= (and b!963199 condMapEmpty!34345) mapIsEmpty!34345))

(assert (= (and b!963199 (not condMapEmpty!34345)) mapNonEmpty!34345))

(get-info :version)

(assert (= (and mapNonEmpty!34345 ((_ is ValueCellFull!10302) mapValue!34345)) b!963204))

(assert (= (and b!963199 ((_ is ValueCellFull!10302) mapDefault!34345)) b!963195))

(assert (= start!82632 b!963199))

(declare-fun m!892667 () Bool)

(assert (=> b!963197 m!892667))

(declare-fun m!892669 () Bool)

(assert (=> b!963197 m!892669))

(assert (=> b!963197 m!892667))

(assert (=> b!963197 m!892669))

(declare-fun m!892671 () Bool)

(assert (=> b!963197 m!892671))

(declare-fun m!892673 () Bool)

(assert (=> start!82632 m!892673))

(declare-fun m!892675 () Bool)

(assert (=> start!82632 m!892675))

(declare-fun m!892677 () Bool)

(assert (=> start!82632 m!892677))

(declare-fun m!892679 () Bool)

(assert (=> mapNonEmpty!34345 m!892679))

(declare-fun m!892681 () Bool)

(assert (=> b!963198 m!892681))

(declare-fun m!892683 () Bool)

(assert (=> b!963196 m!892683))

(assert (=> b!963196 m!892669))

(assert (=> b!963196 m!892683))

(assert (=> b!963196 m!892669))

(declare-fun m!892685 () Bool)

(assert (=> b!963196 m!892685))

(declare-fun m!892687 () Bool)

(assert (=> b!963196 m!892687))

(assert (=> b!963201 m!892669))

(assert (=> b!963201 m!892669))

(declare-fun m!892689 () Bool)

(assert (=> b!963201 m!892689))

(declare-fun m!892691 () Bool)

(assert (=> b!963203 m!892691))

(check-sat (not b_next!18765) b_and!30253 (not mapNonEmpty!34345) (not start!82632) (not b!963203) (not b!963201) (not b!963198) (not b!963196) tp_is_empty!21567 (not b!963197))
(check-sat b_and!30253 (not b_next!18765))

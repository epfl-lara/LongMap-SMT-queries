; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82962 () Bool)

(assert start!82962)

(declare-fun b_free!19089 () Bool)

(declare-fun b_next!19089 () Bool)

(assert (=> start!82962 (= b_free!19089 (not b_next!19089))))

(declare-fun tp!66396 () Bool)

(declare-fun b_and!30577 () Bool)

(assert (=> start!82962 (= tp!66396 b_and!30577)))

(declare-fun b!968325 () Bool)

(declare-fun e!545695 () Bool)

(declare-fun e!545696 () Bool)

(declare-fun mapRes!34840 () Bool)

(assert (=> b!968325 (= e!545695 (and e!545696 mapRes!34840))))

(declare-fun condMapEmpty!34840 () Bool)

(declare-datatypes ((V!34179 0))(
  ( (V!34180 (val!10999 Int)) )
))
(declare-datatypes ((ValueCell!10467 0))(
  ( (ValueCellFull!10467 (v!13557 V!34179)) (EmptyCell!10467) )
))
(declare-datatypes ((array!59865 0))(
  ( (array!59866 (arr!28801 (Array (_ BitVec 32) ValueCell!10467)) (size!29280 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59865)

(declare-fun mapDefault!34840 () ValueCell!10467)

(assert (=> b!968325 (= condMapEmpty!34840 (= (arr!28801 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10467)) mapDefault!34840)))))

(declare-fun mapNonEmpty!34840 () Bool)

(declare-fun tp!66395 () Bool)

(declare-fun e!545698 () Bool)

(assert (=> mapNonEmpty!34840 (= mapRes!34840 (and tp!66395 e!545698))))

(declare-fun mapRest!34840 () (Array (_ BitVec 32) ValueCell!10467))

(declare-fun mapKey!34840 () (_ BitVec 32))

(declare-fun mapValue!34840 () ValueCell!10467)

(assert (=> mapNonEmpty!34840 (= (arr!28801 _values!1400) (store mapRest!34840 mapKey!34840 mapValue!34840))))

(declare-fun b!968326 () Bool)

(declare-fun res!648266 () Bool)

(declare-fun e!545697 () Bool)

(assert (=> b!968326 (=> (not res!648266) (not e!545697))))

(declare-datatypes ((array!59867 0))(
  ( (array!59868 (arr!28802 (Array (_ BitVec 32) (_ BitVec 64))) (size!29281 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59867)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968326 (= res!648266 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29281 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29281 _keys!1686))))))

(declare-fun b!968327 () Bool)

(declare-fun res!648264 () Bool)

(assert (=> b!968327 (=> (not res!648264) (not e!545697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968327 (= res!648264 (validKeyInArray!0 (select (arr!28802 _keys!1686) i!803)))))

(declare-fun b!968328 () Bool)

(assert (=> b!968328 (= e!545697 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34179)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14154 0))(
  ( (tuple2!14155 (_1!7088 (_ BitVec 64)) (_2!7088 V!34179)) )
))
(declare-datatypes ((List!19999 0))(
  ( (Nil!19996) (Cons!19995 (h!21157 tuple2!14154) (t!28362 List!19999)) )
))
(declare-datatypes ((ListLongMap!12851 0))(
  ( (ListLongMap!12852 (toList!6441 List!19999)) )
))
(declare-fun lt!431518 () ListLongMap!12851)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34179)

(declare-fun getCurrentListMap!3674 (array!59867 array!59865 (_ BitVec 32) (_ BitVec 32) V!34179 V!34179 (_ BitVec 32) Int) ListLongMap!12851)

(assert (=> b!968328 (= lt!431518 (getCurrentListMap!3674 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403))))

(declare-fun b!968329 () Bool)

(declare-fun res!648261 () Bool)

(assert (=> b!968329 (=> (not res!648261) (not e!545697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59867 (_ BitVec 32)) Bool)

(assert (=> b!968329 (= res!648261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968330 () Bool)

(declare-fun res!648267 () Bool)

(assert (=> b!968330 (=> (not res!648267) (not e!545697))))

(assert (=> b!968330 (= res!648267 (bvsle from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34840 () Bool)

(assert (=> mapIsEmpty!34840 mapRes!34840))

(declare-fun b!968331 () Bool)

(declare-fun tp_is_empty!21897 () Bool)

(assert (=> b!968331 (= e!545698 tp_is_empty!21897)))

(declare-fun b!968332 () Bool)

(declare-fun res!648268 () Bool)

(assert (=> b!968332 (=> (not res!648268) (not e!545697))))

(assert (=> b!968332 (= res!648268 (and (= (size!29280 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29281 _keys!1686) (size!29280 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968333 () Bool)

(assert (=> b!968333 (= e!545696 tp_is_empty!21897)))

(declare-fun b!968334 () Bool)

(declare-fun res!648265 () Bool)

(assert (=> b!968334 (=> (not res!648265) (not e!545697))))

(declare-fun contains!5542 (ListLongMap!12851 (_ BitVec 64)) Bool)

(assert (=> b!968334 (= res!648265 (contains!5542 (getCurrentListMap!3674 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28802 _keys!1686) i!803)))))

(declare-fun b!968335 () Bool)

(declare-fun res!648263 () Bool)

(assert (=> b!968335 (=> (not res!648263) (not e!545697))))

(declare-datatypes ((List!20000 0))(
  ( (Nil!19997) (Cons!19996 (h!21158 (_ BitVec 64)) (t!28363 List!20000)) )
))
(declare-fun arrayNoDuplicates!0 (array!59867 (_ BitVec 32) List!20000) Bool)

(assert (=> b!968335 (= res!648263 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19997))))

(declare-fun res!648262 () Bool)

(assert (=> start!82962 (=> (not res!648262) (not e!545697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82962 (= res!648262 (validMask!0 mask!2110))))

(assert (=> start!82962 e!545697))

(assert (=> start!82962 true))

(declare-fun array_inv!22295 (array!59865) Bool)

(assert (=> start!82962 (and (array_inv!22295 _values!1400) e!545695)))

(declare-fun array_inv!22296 (array!59867) Bool)

(assert (=> start!82962 (array_inv!22296 _keys!1686)))

(assert (=> start!82962 tp!66396))

(assert (=> start!82962 tp_is_empty!21897))

(assert (= (and start!82962 res!648262) b!968332))

(assert (= (and b!968332 res!648268) b!968329))

(assert (= (and b!968329 res!648261) b!968335))

(assert (= (and b!968335 res!648263) b!968326))

(assert (= (and b!968326 res!648266) b!968327))

(assert (= (and b!968327 res!648264) b!968334))

(assert (= (and b!968334 res!648265) b!968330))

(assert (= (and b!968330 res!648267) b!968328))

(assert (= (and b!968325 condMapEmpty!34840) mapIsEmpty!34840))

(assert (= (and b!968325 (not condMapEmpty!34840)) mapNonEmpty!34840))

(get-info :version)

(assert (= (and mapNonEmpty!34840 ((_ is ValueCellFull!10467) mapValue!34840)) b!968331))

(assert (= (and b!968325 ((_ is ValueCellFull!10467) mapDefault!34840)) b!968333))

(assert (= start!82962 b!968325))

(declare-fun m!896707 () Bool)

(assert (=> mapNonEmpty!34840 m!896707))

(declare-fun m!896709 () Bool)

(assert (=> b!968329 m!896709))

(declare-fun m!896711 () Bool)

(assert (=> b!968328 m!896711))

(declare-fun m!896713 () Bool)

(assert (=> b!968334 m!896713))

(declare-fun m!896715 () Bool)

(assert (=> b!968334 m!896715))

(assert (=> b!968334 m!896713))

(assert (=> b!968334 m!896715))

(declare-fun m!896717 () Bool)

(assert (=> b!968334 m!896717))

(assert (=> b!968327 m!896715))

(assert (=> b!968327 m!896715))

(declare-fun m!896719 () Bool)

(assert (=> b!968327 m!896719))

(declare-fun m!896721 () Bool)

(assert (=> start!82962 m!896721))

(declare-fun m!896723 () Bool)

(assert (=> start!82962 m!896723))

(declare-fun m!896725 () Bool)

(assert (=> start!82962 m!896725))

(declare-fun m!896727 () Bool)

(assert (=> b!968335 m!896727))

(check-sat (not b!968328) b_and!30577 (not start!82962) (not b!968335) (not b!968329) (not mapNonEmpty!34840) (not b!968334) (not b_next!19089) (not b!968327) tp_is_empty!21897)
(check-sat b_and!30577 (not b_next!19089))

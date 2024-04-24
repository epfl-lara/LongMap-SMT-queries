; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82744 () Bool)

(assert start!82744)

(declare-fun b_free!18709 () Bool)

(declare-fun b_next!18709 () Bool)

(assert (=> start!82744 (= b_free!18709 (not b_next!18709))))

(declare-fun tp!65248 () Bool)

(declare-fun b_and!30207 () Bool)

(assert (=> start!82744 (= tp!65248 b_and!30207)))

(declare-fun res!644379 () Bool)

(declare-fun e!543284 () Bool)

(assert (=> start!82744 (=> (not res!644379) (not e!543284))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82744 (= res!644379 (validMask!0 mask!2110))))

(assert (=> start!82744 e!543284))

(assert (=> start!82744 true))

(declare-datatypes ((V!33665 0))(
  ( (V!33666 (val!10806 Int)) )
))
(declare-datatypes ((ValueCell!10274 0))(
  ( (ValueCellFull!10274 (v!13361 V!33665)) (EmptyCell!10274) )
))
(declare-datatypes ((array!59136 0))(
  ( (array!59137 (arr!28432 (Array (_ BitVec 32) ValueCell!10274)) (size!28912 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59136)

(declare-fun e!543285 () Bool)

(declare-fun array_inv!22101 (array!59136) Bool)

(assert (=> start!82744 (and (array_inv!22101 _values!1400) e!543285)))

(declare-datatypes ((array!59138 0))(
  ( (array!59139 (arr!28433 (Array (_ BitVec 32) (_ BitVec 64))) (size!28913 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59138)

(declare-fun array_inv!22102 (array!59138) Bool)

(assert (=> start!82744 (array_inv!22102 _keys!1686)))

(assert (=> start!82744 tp!65248))

(declare-fun tp_is_empty!21511 () Bool)

(assert (=> start!82744 tp_is_empty!21511))

(declare-fun mapIsEmpty!34261 () Bool)

(declare-fun mapRes!34261 () Bool)

(assert (=> mapIsEmpty!34261 mapRes!34261))

(declare-fun mapNonEmpty!34261 () Bool)

(declare-fun tp!65247 () Bool)

(declare-fun e!543287 () Bool)

(assert (=> mapNonEmpty!34261 (= mapRes!34261 (and tp!65247 e!543287))))

(declare-fun mapKey!34261 () (_ BitVec 32))

(declare-fun mapRest!34261 () (Array (_ BitVec 32) ValueCell!10274))

(declare-fun mapValue!34261 () ValueCell!10274)

(assert (=> mapNonEmpty!34261 (= (arr!28432 _values!1400) (store mapRest!34261 mapKey!34261 mapValue!34261))))

(declare-fun b!963260 () Bool)

(declare-fun e!543283 () Bool)

(assert (=> b!963260 (= e!543283 tp_is_empty!21511)))

(declare-fun b!963261 () Bool)

(declare-fun res!644374 () Bool)

(assert (=> b!963261 (=> (not res!644374) (not e!543284))))

(declare-datatypes ((List!19711 0))(
  ( (Nil!19708) (Cons!19707 (h!20875 (_ BitVec 64)) (t!28066 List!19711)) )
))
(declare-fun arrayNoDuplicates!0 (array!59138 (_ BitVec 32) List!19711) Bool)

(assert (=> b!963261 (= res!644374 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19708))))

(declare-fun b!963262 () Bool)

(assert (=> b!963262 (= e!543285 (and e!543283 mapRes!34261))))

(declare-fun condMapEmpty!34261 () Bool)

(declare-fun mapDefault!34261 () ValueCell!10274)

(assert (=> b!963262 (= condMapEmpty!34261 (= (arr!28432 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10274)) mapDefault!34261)))))

(declare-fun b!963263 () Bool)

(declare-fun res!644375 () Bool)

(assert (=> b!963263 (=> (not res!644375) (not e!543284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59138 (_ BitVec 32)) Bool)

(assert (=> b!963263 (= res!644375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963264 () Bool)

(declare-fun res!644378 () Bool)

(assert (=> b!963264 (=> (not res!644378) (not e!543284))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963264 (= res!644378 (and (= (size!28912 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28913 _keys!1686) (size!28912 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963265 () Bool)

(assert (=> b!963265 (= e!543284 false)))

(declare-fun minValue!1342 () V!33665)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431228 () Bool)

(declare-fun zeroValue!1342 () V!33665)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13860 0))(
  ( (tuple2!13861 (_1!6941 (_ BitVec 64)) (_2!6941 V!33665)) )
))
(declare-datatypes ((List!19712 0))(
  ( (Nil!19709) (Cons!19708 (h!20876 tuple2!13860) (t!28067 List!19712)) )
))
(declare-datatypes ((ListLongMap!12559 0))(
  ( (ListLongMap!12560 (toList!6295 List!19712)) )
))
(declare-fun contains!5410 (ListLongMap!12559 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3528 (array!59138 array!59136 (_ BitVec 32) (_ BitVec 32) V!33665 V!33665 (_ BitVec 32) Int) ListLongMap!12559)

(assert (=> b!963265 (= lt!431228 (contains!5410 (getCurrentListMap!3528 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28433 _keys!1686) i!803)))))

(declare-fun b!963266 () Bool)

(declare-fun res!644376 () Bool)

(assert (=> b!963266 (=> (not res!644376) (not e!543284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963266 (= res!644376 (validKeyInArray!0 (select (arr!28433 _keys!1686) i!803)))))

(declare-fun b!963267 () Bool)

(assert (=> b!963267 (= e!543287 tp_is_empty!21511)))

(declare-fun b!963268 () Bool)

(declare-fun res!644377 () Bool)

(assert (=> b!963268 (=> (not res!644377) (not e!543284))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963268 (= res!644377 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28913 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28913 _keys!1686))))))

(assert (= (and start!82744 res!644379) b!963264))

(assert (= (and b!963264 res!644378) b!963263))

(assert (= (and b!963263 res!644375) b!963261))

(assert (= (and b!963261 res!644374) b!963268))

(assert (= (and b!963268 res!644377) b!963266))

(assert (= (and b!963266 res!644376) b!963265))

(assert (= (and b!963262 condMapEmpty!34261) mapIsEmpty!34261))

(assert (= (and b!963262 (not condMapEmpty!34261)) mapNonEmpty!34261))

(get-info :version)

(assert (= (and mapNonEmpty!34261 ((_ is ValueCellFull!10274) mapValue!34261)) b!963267))

(assert (= (and b!963262 ((_ is ValueCellFull!10274) mapDefault!34261)) b!963260))

(assert (= start!82744 b!963262))

(declare-fun m!893323 () Bool)

(assert (=> b!963261 m!893323))

(declare-fun m!893325 () Bool)

(assert (=> b!963265 m!893325))

(declare-fun m!893327 () Bool)

(assert (=> b!963265 m!893327))

(assert (=> b!963265 m!893325))

(assert (=> b!963265 m!893327))

(declare-fun m!893329 () Bool)

(assert (=> b!963265 m!893329))

(assert (=> b!963266 m!893327))

(assert (=> b!963266 m!893327))

(declare-fun m!893331 () Bool)

(assert (=> b!963266 m!893331))

(declare-fun m!893333 () Bool)

(assert (=> mapNonEmpty!34261 m!893333))

(declare-fun m!893335 () Bool)

(assert (=> start!82744 m!893335))

(declare-fun m!893337 () Bool)

(assert (=> start!82744 m!893337))

(declare-fun m!893339 () Bool)

(assert (=> start!82744 m!893339))

(declare-fun m!893341 () Bool)

(assert (=> b!963263 m!893341))

(check-sat (not b!963263) tp_is_empty!21511 (not b!963266) (not start!82744) (not b_next!18709) (not b!963265) (not b!963261) (not mapNonEmpty!34261) b_and!30207)
(check-sat b_and!30207 (not b_next!18709))

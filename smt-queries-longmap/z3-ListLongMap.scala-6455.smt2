; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82552 () Bool)

(assert start!82552)

(declare-fun b_free!18703 () Bool)

(declare-fun b_next!18703 () Bool)

(assert (=> start!82552 (= b_free!18703 (not b_next!18703))))

(declare-fun tp!65230 () Bool)

(declare-fun b_and!30165 () Bool)

(assert (=> start!82552 (= tp!65230 b_and!30165)))

(declare-fun res!643866 () Bool)

(declare-fun e!542512 () Bool)

(assert (=> start!82552 (=> (not res!643866) (not e!542512))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82552 (= res!643866 (validMask!0 mask!2110))))

(assert (=> start!82552 e!542512))

(assert (=> start!82552 true))

(declare-datatypes ((V!33657 0))(
  ( (V!33658 (val!10803 Int)) )
))
(declare-datatypes ((ValueCell!10271 0))(
  ( (ValueCellFull!10271 (v!13360 V!33657)) (EmptyCell!10271) )
))
(declare-datatypes ((array!59036 0))(
  ( (array!59037 (arr!28387 (Array (_ BitVec 32) ValueCell!10271)) (size!28868 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59036)

(declare-fun e!542511 () Bool)

(declare-fun array_inv!22055 (array!59036) Bool)

(assert (=> start!82552 (and (array_inv!22055 _values!1400) e!542511)))

(declare-datatypes ((array!59038 0))(
  ( (array!59039 (arr!28388 (Array (_ BitVec 32) (_ BitVec 64))) (size!28869 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59038)

(declare-fun array_inv!22056 (array!59038) Bool)

(assert (=> start!82552 (array_inv!22056 _keys!1686)))

(assert (=> start!82552 tp!65230))

(declare-fun tp_is_empty!21505 () Bool)

(assert (=> start!82552 tp_is_empty!21505))

(declare-fun b!962037 () Bool)

(declare-fun res!643871 () Bool)

(assert (=> b!962037 (=> (not res!643871) (not e!542512))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962037 (= res!643871 (and (= (size!28868 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28869 _keys!1686) (size!28868 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962038 () Bool)

(declare-fun e!542508 () Bool)

(declare-fun mapRes!34252 () Bool)

(assert (=> b!962038 (= e!542511 (and e!542508 mapRes!34252))))

(declare-fun condMapEmpty!34252 () Bool)

(declare-fun mapDefault!34252 () ValueCell!10271)

(assert (=> b!962038 (= condMapEmpty!34252 (= (arr!28387 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10271)) mapDefault!34252)))))

(declare-fun b!962039 () Bool)

(declare-fun res!643868 () Bool)

(assert (=> b!962039 (=> (not res!643868) (not e!542512))))

(declare-datatypes ((List!19741 0))(
  ( (Nil!19738) (Cons!19737 (h!20899 (_ BitVec 64)) (t!28095 List!19741)) )
))
(declare-fun arrayNoDuplicates!0 (array!59038 (_ BitVec 32) List!19741) Bool)

(assert (=> b!962039 (= res!643868 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19738))))

(declare-fun b!962040 () Bool)

(assert (=> b!962040 (= e!542508 tp_is_empty!21505)))

(declare-fun b!962041 () Bool)

(declare-fun e!542509 () Bool)

(assert (=> b!962041 (= e!542509 tp_is_empty!21505)))

(declare-fun b!962042 () Bool)

(declare-fun res!643867 () Bool)

(assert (=> b!962042 (=> (not res!643867) (not e!542512))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962042 (= res!643867 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28869 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28869 _keys!1686))))))

(declare-fun b!962043 () Bool)

(declare-fun res!643870 () Bool)

(assert (=> b!962043 (=> (not res!643870) (not e!542512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59038 (_ BitVec 32)) Bool)

(assert (=> b!962043 (= res!643870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962044 () Bool)

(assert (=> b!962044 (= e!542512 false)))

(declare-fun minValue!1342 () V!33657)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430622 () Bool)

(declare-fun zeroValue!1342 () V!33657)

(declare-datatypes ((tuple2!13932 0))(
  ( (tuple2!13933 (_1!6977 (_ BitVec 64)) (_2!6977 V!33657)) )
))
(declare-datatypes ((List!19742 0))(
  ( (Nil!19739) (Cons!19738 (h!20900 tuple2!13932) (t!28096 List!19742)) )
))
(declare-datatypes ((ListLongMap!12619 0))(
  ( (ListLongMap!12620 (toList!6325 List!19742)) )
))
(declare-fun contains!5372 (ListLongMap!12619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3487 (array!59038 array!59036 (_ BitVec 32) (_ BitVec 32) V!33657 V!33657 (_ BitVec 32) Int) ListLongMap!12619)

(assert (=> b!962044 (= lt!430622 (contains!5372 (getCurrentListMap!3487 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28388 _keys!1686) i!803)))))

(declare-fun b!962045 () Bool)

(declare-fun res!643869 () Bool)

(assert (=> b!962045 (=> (not res!643869) (not e!542512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962045 (= res!643869 (validKeyInArray!0 (select (arr!28388 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34252 () Bool)

(declare-fun tp!65229 () Bool)

(assert (=> mapNonEmpty!34252 (= mapRes!34252 (and tp!65229 e!542509))))

(declare-fun mapKey!34252 () (_ BitVec 32))

(declare-fun mapRest!34252 () (Array (_ BitVec 32) ValueCell!10271))

(declare-fun mapValue!34252 () ValueCell!10271)

(assert (=> mapNonEmpty!34252 (= (arr!28387 _values!1400) (store mapRest!34252 mapKey!34252 mapValue!34252))))

(declare-fun mapIsEmpty!34252 () Bool)

(assert (=> mapIsEmpty!34252 mapRes!34252))

(assert (= (and start!82552 res!643866) b!962037))

(assert (= (and b!962037 res!643871) b!962043))

(assert (= (and b!962043 res!643870) b!962039))

(assert (= (and b!962039 res!643868) b!962042))

(assert (= (and b!962042 res!643867) b!962045))

(assert (= (and b!962045 res!643869) b!962044))

(assert (= (and b!962038 condMapEmpty!34252) mapIsEmpty!34252))

(assert (= (and b!962038 (not condMapEmpty!34252)) mapNonEmpty!34252))

(get-info :version)

(assert (= (and mapNonEmpty!34252 ((_ is ValueCellFull!10271) mapValue!34252)) b!962041))

(assert (= (and b!962038 ((_ is ValueCellFull!10271) mapDefault!34252)) b!962040))

(assert (= start!82552 b!962038))

(declare-fun m!891211 () Bool)

(assert (=> b!962039 m!891211))

(declare-fun m!891213 () Bool)

(assert (=> mapNonEmpty!34252 m!891213))

(declare-fun m!891215 () Bool)

(assert (=> b!962044 m!891215))

(declare-fun m!891217 () Bool)

(assert (=> b!962044 m!891217))

(assert (=> b!962044 m!891215))

(assert (=> b!962044 m!891217))

(declare-fun m!891219 () Bool)

(assert (=> b!962044 m!891219))

(declare-fun m!891221 () Bool)

(assert (=> b!962043 m!891221))

(declare-fun m!891223 () Bool)

(assert (=> start!82552 m!891223))

(declare-fun m!891225 () Bool)

(assert (=> start!82552 m!891225))

(declare-fun m!891227 () Bool)

(assert (=> start!82552 m!891227))

(assert (=> b!962045 m!891217))

(assert (=> b!962045 m!891217))

(declare-fun m!891229 () Bool)

(assert (=> b!962045 m!891229))

(check-sat b_and!30165 (not b!962044) tp_is_empty!21505 (not b!962043) (not b_next!18703) (not start!82552) (not b!962045) (not mapNonEmpty!34252) (not b!962039))
(check-sat b_and!30165 (not b_next!18703))

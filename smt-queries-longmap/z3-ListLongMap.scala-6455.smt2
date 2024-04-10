; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82572 () Bool)

(assert start!82572)

(declare-fun b_free!18705 () Bool)

(declare-fun b_next!18705 () Bool)

(assert (=> start!82572 (= b_free!18705 (not b_next!18705))))

(declare-fun tp!65235 () Bool)

(declare-fun b_and!30193 () Bool)

(assert (=> start!82572 (= tp!65235 b_and!30193)))

(declare-fun b!962303 () Bool)

(declare-fun res!643995 () Bool)

(declare-fun e!542675 () Bool)

(assert (=> b!962303 (=> (not res!643995) (not e!542675))))

(declare-datatypes ((array!59111 0))(
  ( (array!59112 (arr!28424 (Array (_ BitVec 32) (_ BitVec 64))) (size!28903 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59111)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962303 (= res!643995 (validKeyInArray!0 (select (arr!28424 _keys!1686) i!803)))))

(declare-fun b!962304 () Bool)

(declare-fun res!643998 () Bool)

(assert (=> b!962304 (=> (not res!643998) (not e!542675))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33659 0))(
  ( (V!33660 (val!10804 Int)) )
))
(declare-datatypes ((ValueCell!10272 0))(
  ( (ValueCellFull!10272 (v!13362 V!33659)) (EmptyCell!10272) )
))
(declare-datatypes ((array!59113 0))(
  ( (array!59114 (arr!28425 (Array (_ BitVec 32) ValueCell!10272)) (size!28904 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59113)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962304 (= res!643998 (and (= (size!28904 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28903 _keys!1686) (size!28904 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962305 () Bool)

(declare-fun e!542673 () Bool)

(declare-fun tp_is_empty!21507 () Bool)

(assert (=> b!962305 (= e!542673 tp_is_empty!21507)))

(declare-fun b!962307 () Bool)

(declare-fun e!542674 () Bool)

(assert (=> b!962307 (= e!542674 tp_is_empty!21507)))

(declare-fun b!962308 () Bool)

(declare-fun e!542671 () Bool)

(declare-fun mapRes!34255 () Bool)

(assert (=> b!962308 (= e!542671 (and e!542673 mapRes!34255))))

(declare-fun condMapEmpty!34255 () Bool)

(declare-fun mapDefault!34255 () ValueCell!10272)

(assert (=> b!962308 (= condMapEmpty!34255 (= (arr!28425 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10272)) mapDefault!34255)))))

(declare-fun mapIsEmpty!34255 () Bool)

(assert (=> mapIsEmpty!34255 mapRes!34255))

(declare-fun b!962309 () Bool)

(assert (=> b!962309 (= e!542675 false)))

(declare-fun lt!430861 () Bool)

(declare-fun minValue!1342 () V!33659)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33659)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13876 0))(
  ( (tuple2!13877 (_1!6949 (_ BitVec 64)) (_2!6949 V!33659)) )
))
(declare-datatypes ((List!19726 0))(
  ( (Nil!19723) (Cons!19722 (h!20884 tuple2!13876) (t!28089 List!19726)) )
))
(declare-datatypes ((ListLongMap!12573 0))(
  ( (ListLongMap!12574 (toList!6302 List!19726)) )
))
(declare-fun contains!5405 (ListLongMap!12573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3535 (array!59111 array!59113 (_ BitVec 32) (_ BitVec 32) V!33659 V!33659 (_ BitVec 32) Int) ListLongMap!12573)

(assert (=> b!962309 (= lt!430861 (contains!5405 (getCurrentListMap!3535 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28424 _keys!1686) i!803)))))

(declare-fun res!643994 () Bool)

(assert (=> start!82572 (=> (not res!643994) (not e!542675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82572 (= res!643994 (validMask!0 mask!2110))))

(assert (=> start!82572 e!542675))

(assert (=> start!82572 true))

(declare-fun array_inv!22025 (array!59113) Bool)

(assert (=> start!82572 (and (array_inv!22025 _values!1400) e!542671)))

(declare-fun array_inv!22026 (array!59111) Bool)

(assert (=> start!82572 (array_inv!22026 _keys!1686)))

(assert (=> start!82572 tp!65235))

(assert (=> start!82572 tp_is_empty!21507))

(declare-fun b!962306 () Bool)

(declare-fun res!643999 () Bool)

(assert (=> b!962306 (=> (not res!643999) (not e!542675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59111 (_ BitVec 32)) Bool)

(assert (=> b!962306 (= res!643999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962310 () Bool)

(declare-fun res!643996 () Bool)

(assert (=> b!962310 (=> (not res!643996) (not e!542675))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962310 (= res!643996 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28903 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28903 _keys!1686))))))

(declare-fun mapNonEmpty!34255 () Bool)

(declare-fun tp!65234 () Bool)

(assert (=> mapNonEmpty!34255 (= mapRes!34255 (and tp!65234 e!542674))))

(declare-fun mapValue!34255 () ValueCell!10272)

(declare-fun mapRest!34255 () (Array (_ BitVec 32) ValueCell!10272))

(declare-fun mapKey!34255 () (_ BitVec 32))

(assert (=> mapNonEmpty!34255 (= (arr!28425 _values!1400) (store mapRest!34255 mapKey!34255 mapValue!34255))))

(declare-fun b!962311 () Bool)

(declare-fun res!643997 () Bool)

(assert (=> b!962311 (=> (not res!643997) (not e!542675))))

(declare-datatypes ((List!19727 0))(
  ( (Nil!19724) (Cons!19723 (h!20885 (_ BitVec 64)) (t!28090 List!19727)) )
))
(declare-fun arrayNoDuplicates!0 (array!59111 (_ BitVec 32) List!19727) Bool)

(assert (=> b!962311 (= res!643997 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19724))))

(assert (= (and start!82572 res!643994) b!962304))

(assert (= (and b!962304 res!643998) b!962306))

(assert (= (and b!962306 res!643999) b!962311))

(assert (= (and b!962311 res!643997) b!962310))

(assert (= (and b!962310 res!643996) b!962303))

(assert (= (and b!962303 res!643995) b!962309))

(assert (= (and b!962308 condMapEmpty!34255) mapIsEmpty!34255))

(assert (= (and b!962308 (not condMapEmpty!34255)) mapNonEmpty!34255))

(get-info :version)

(assert (= (and mapNonEmpty!34255 ((_ is ValueCellFull!10272) mapValue!34255)) b!962307))

(assert (= (and b!962308 ((_ is ValueCellFull!10272) mapDefault!34255)) b!962305))

(assert (= start!82572 b!962308))

(declare-fun m!891989 () Bool)

(assert (=> b!962311 m!891989))

(declare-fun m!891991 () Bool)

(assert (=> start!82572 m!891991))

(declare-fun m!891993 () Bool)

(assert (=> start!82572 m!891993))

(declare-fun m!891995 () Bool)

(assert (=> start!82572 m!891995))

(declare-fun m!891997 () Bool)

(assert (=> b!962306 m!891997))

(declare-fun m!891999 () Bool)

(assert (=> b!962309 m!891999))

(declare-fun m!892001 () Bool)

(assert (=> b!962309 m!892001))

(assert (=> b!962309 m!891999))

(assert (=> b!962309 m!892001))

(declare-fun m!892003 () Bool)

(assert (=> b!962309 m!892003))

(assert (=> b!962303 m!892001))

(assert (=> b!962303 m!892001))

(declare-fun m!892005 () Bool)

(assert (=> b!962303 m!892005))

(declare-fun m!892007 () Bool)

(assert (=> mapNonEmpty!34255 m!892007))

(check-sat (not b!962303) (not b!962311) (not b!962306) (not b!962309) b_and!30193 (not b_next!18705) tp_is_empty!21507 (not start!82572) (not mapNonEmpty!34255))
(check-sat b_and!30193 (not b_next!18705))

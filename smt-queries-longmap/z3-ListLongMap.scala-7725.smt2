; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97272 () Bool)

(assert start!97272)

(declare-fun b!1105044 () Bool)

(declare-fun e!630920 () Bool)

(declare-fun e!630919 () Bool)

(declare-fun mapRes!42793 () Bool)

(assert (=> b!1105044 (= e!630920 (and e!630919 mapRes!42793))))

(declare-fun condMapEmpty!42793 () Bool)

(declare-datatypes ((V!41561 0))(
  ( (V!41562 (val!13719 Int)) )
))
(declare-datatypes ((ValueCell!12953 0))(
  ( (ValueCellFull!12953 (v!16347 V!41561)) (EmptyCell!12953) )
))
(declare-datatypes ((array!71607 0))(
  ( (array!71608 (arr!34454 (Array (_ BitVec 32) ValueCell!12953)) (size!34991 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71607)

(declare-fun mapDefault!42793 () ValueCell!12953)

(assert (=> b!1105044 (= condMapEmpty!42793 (= (arr!34454 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12953)) mapDefault!42793)))))

(declare-datatypes ((array!71609 0))(
  ( (array!71610 (arr!34455 (Array (_ BitVec 32) (_ BitVec 64))) (size!34992 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71609)

(declare-fun b!1105045 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!630921 () Bool)

(assert (=> b!1105045 (= e!630921 (and (= (select (arr!34455 _keys!1208) i!673) k0!934) (= (size!34992 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34992 _keys!1208))))))

(declare-fun b!1105046 () Bool)

(declare-fun res!736856 () Bool)

(assert (=> b!1105046 (=> (not res!736856) (not e!630921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105046 (= res!736856 (validMask!0 mask!1564))))

(declare-fun b!1105047 () Bool)

(declare-fun tp_is_empty!27325 () Bool)

(assert (=> b!1105047 (= e!630919 tp_is_empty!27325)))

(declare-fun mapIsEmpty!42793 () Bool)

(assert (=> mapIsEmpty!42793 mapRes!42793))

(declare-fun mapNonEmpty!42793 () Bool)

(declare-fun tp!81713 () Bool)

(declare-fun e!630917 () Bool)

(assert (=> mapNonEmpty!42793 (= mapRes!42793 (and tp!81713 e!630917))))

(declare-fun mapValue!42793 () ValueCell!12953)

(declare-fun mapKey!42793 () (_ BitVec 32))

(declare-fun mapRest!42793 () (Array (_ BitVec 32) ValueCell!12953))

(assert (=> mapNonEmpty!42793 (= (arr!34454 _values!996) (store mapRest!42793 mapKey!42793 mapValue!42793))))

(declare-fun b!1105048 () Bool)

(assert (=> b!1105048 (= e!630917 tp_is_empty!27325)))

(declare-fun res!736854 () Bool)

(assert (=> start!97272 (=> (not res!736854) (not e!630921))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97272 (= res!736854 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34992 _keys!1208))))))

(assert (=> start!97272 e!630921))

(declare-fun array_inv!26566 (array!71609) Bool)

(assert (=> start!97272 (array_inv!26566 _keys!1208)))

(assert (=> start!97272 true))

(declare-fun array_inv!26567 (array!71607) Bool)

(assert (=> start!97272 (and (array_inv!26567 _values!996) e!630920)))

(declare-fun b!1105049 () Bool)

(declare-fun res!736852 () Bool)

(assert (=> b!1105049 (=> (not res!736852) (not e!630921))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105049 (= res!736852 (and (= (size!34991 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34992 _keys!1208) (size!34991 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105050 () Bool)

(declare-fun res!736851 () Bool)

(assert (=> b!1105050 (=> (not res!736851) (not e!630921))))

(declare-datatypes ((List!24067 0))(
  ( (Nil!24064) (Cons!24063 (h!25281 (_ BitVec 64)) (t!34324 List!24067)) )
))
(declare-fun arrayNoDuplicates!0 (array!71609 (_ BitVec 32) List!24067) Bool)

(assert (=> b!1105050 (= res!736851 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24064))))

(declare-fun b!1105051 () Bool)

(declare-fun res!736853 () Bool)

(assert (=> b!1105051 (=> (not res!736853) (not e!630921))))

(assert (=> b!1105051 (= res!736853 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34992 _keys!1208))))))

(declare-fun b!1105052 () Bool)

(declare-fun res!736857 () Bool)

(assert (=> b!1105052 (=> (not res!736857) (not e!630921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105052 (= res!736857 (validKeyInArray!0 k0!934))))

(declare-fun b!1105053 () Bool)

(declare-fun res!736855 () Bool)

(assert (=> b!1105053 (=> (not res!736855) (not e!630921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71609 (_ BitVec 32)) Bool)

(assert (=> b!1105053 (= res!736855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97272 res!736854) b!1105046))

(assert (= (and b!1105046 res!736856) b!1105049))

(assert (= (and b!1105049 res!736852) b!1105053))

(assert (= (and b!1105053 res!736855) b!1105050))

(assert (= (and b!1105050 res!736851) b!1105051))

(assert (= (and b!1105051 res!736853) b!1105052))

(assert (= (and b!1105052 res!736857) b!1105045))

(assert (= (and b!1105044 condMapEmpty!42793) mapIsEmpty!42793))

(assert (= (and b!1105044 (not condMapEmpty!42793)) mapNonEmpty!42793))

(get-info :version)

(assert (= (and mapNonEmpty!42793 ((_ is ValueCellFull!12953) mapValue!42793)) b!1105048))

(assert (= (and b!1105044 ((_ is ValueCellFull!12953) mapDefault!42793)) b!1105047))

(assert (= start!97272 b!1105044))

(declare-fun m!1025425 () Bool)

(assert (=> mapNonEmpty!42793 m!1025425))

(declare-fun m!1025427 () Bool)

(assert (=> b!1105046 m!1025427))

(declare-fun m!1025429 () Bool)

(assert (=> b!1105045 m!1025429))

(declare-fun m!1025431 () Bool)

(assert (=> start!97272 m!1025431))

(declare-fun m!1025433 () Bool)

(assert (=> start!97272 m!1025433))

(declare-fun m!1025435 () Bool)

(assert (=> b!1105052 m!1025435))

(declare-fun m!1025437 () Bool)

(assert (=> b!1105053 m!1025437))

(declare-fun m!1025439 () Bool)

(assert (=> b!1105050 m!1025439))

(check-sat tp_is_empty!27325 (not b!1105050) (not b!1105046) (not start!97272) (not b!1105052) (not b!1105053) (not mapNonEmpty!42793))
(check-sat)

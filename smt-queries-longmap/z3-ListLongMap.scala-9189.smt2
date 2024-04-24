; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110706 () Bool)

(assert start!110706)

(declare-fun b!1308249 () Bool)

(declare-fun e!746583 () Bool)

(declare-fun e!746582 () Bool)

(declare-fun mapRes!54199 () Bool)

(assert (=> b!1308249 (= e!746583 (and e!746582 mapRes!54199))))

(declare-fun condMapEmpty!54199 () Bool)

(declare-datatypes ((V!51833 0))(
  ( (V!51834 (val!17598 Int)) )
))
(declare-datatypes ((ValueCell!16625 0))(
  ( (ValueCellFull!16625 (v!20220 V!51833)) (EmptyCell!16625) )
))
(declare-datatypes ((array!87163 0))(
  ( (array!87164 (arr!42057 (Array (_ BitVec 32) ValueCell!16625)) (size!42608 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87163)

(declare-fun mapDefault!54199 () ValueCell!16625)

(assert (=> b!1308249 (= condMapEmpty!54199 (= (arr!42057 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16625)) mapDefault!54199)))))

(declare-fun mapNonEmpty!54199 () Bool)

(declare-fun tp!103279 () Bool)

(declare-fun e!746585 () Bool)

(assert (=> mapNonEmpty!54199 (= mapRes!54199 (and tp!103279 e!746585))))

(declare-fun mapValue!54199 () ValueCell!16625)

(declare-fun mapKey!54199 () (_ BitVec 32))

(declare-fun mapRest!54199 () (Array (_ BitVec 32) ValueCell!16625))

(assert (=> mapNonEmpty!54199 (= (arr!42057 _values!1354) (store mapRest!54199 mapKey!54199 mapValue!54199))))

(declare-fun b!1308250 () Bool)

(declare-fun tp_is_empty!35047 () Bool)

(assert (=> b!1308250 (= e!746582 tp_is_empty!35047)))

(declare-fun b!1308251 () Bool)

(declare-fun res!868086 () Bool)

(declare-fun e!746584 () Bool)

(assert (=> b!1308251 (=> (not res!868086) (not e!746584))))

(declare-datatypes ((array!87165 0))(
  ( (array!87166 (arr!42058 (Array (_ BitVec 32) (_ BitVec 64))) (size!42609 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87165)

(declare-datatypes ((List!29856 0))(
  ( (Nil!29853) (Cons!29852 (h!31070 (_ BitVec 64)) (t!43454 List!29856)) )
))
(declare-fun arrayNoDuplicates!0 (array!87165 (_ BitVec 32) List!29856) Bool)

(assert (=> b!1308251 (= res!868086 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29853))))

(declare-fun b!1308252 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308252 (= e!746584 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42609 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2020 (size!42609 _keys!1628))))))

(declare-fun mapIsEmpty!54199 () Bool)

(assert (=> mapIsEmpty!54199 mapRes!54199))

(declare-fun b!1308254 () Bool)

(declare-fun res!868088 () Bool)

(assert (=> b!1308254 (=> (not res!868088) (not e!746584))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87165 (_ BitVec 32)) Bool)

(assert (=> b!1308254 (= res!868088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308255 () Bool)

(declare-fun res!868087 () Bool)

(assert (=> b!1308255 (=> (not res!868087) (not e!746584))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308255 (= res!868087 (and (= (size!42608 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42609 _keys!1628) (size!42608 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308253 () Bool)

(assert (=> b!1308253 (= e!746585 tp_is_empty!35047)))

(declare-fun res!868085 () Bool)

(assert (=> start!110706 (=> (not res!868085) (not e!746584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110706 (= res!868085 (validMask!0 mask!2040))))

(assert (=> start!110706 e!746584))

(declare-fun array_inv!32047 (array!87165) Bool)

(assert (=> start!110706 (array_inv!32047 _keys!1628)))

(assert (=> start!110706 true))

(declare-fun array_inv!32048 (array!87163) Bool)

(assert (=> start!110706 (and (array_inv!32048 _values!1354) e!746583)))

(assert (= (and start!110706 res!868085) b!1308255))

(assert (= (and b!1308255 res!868087) b!1308254))

(assert (= (and b!1308254 res!868088) b!1308251))

(assert (= (and b!1308251 res!868086) b!1308252))

(assert (= (and b!1308249 condMapEmpty!54199) mapIsEmpty!54199))

(assert (= (and b!1308249 (not condMapEmpty!54199)) mapNonEmpty!54199))

(get-info :version)

(assert (= (and mapNonEmpty!54199 ((_ is ValueCellFull!16625) mapValue!54199)) b!1308253))

(assert (= (and b!1308249 ((_ is ValueCellFull!16625) mapDefault!54199)) b!1308250))

(assert (= start!110706 b!1308249))

(declare-fun m!1199411 () Bool)

(assert (=> mapNonEmpty!54199 m!1199411))

(declare-fun m!1199413 () Bool)

(assert (=> b!1308251 m!1199413))

(declare-fun m!1199415 () Bool)

(assert (=> b!1308254 m!1199415))

(declare-fun m!1199417 () Bool)

(assert (=> start!110706 m!1199417))

(declare-fun m!1199419 () Bool)

(assert (=> start!110706 m!1199419))

(declare-fun m!1199421 () Bool)

(assert (=> start!110706 m!1199421))

(check-sat (not b!1308251) tp_is_empty!35047 (not b!1308254) (not start!110706) (not mapNonEmpty!54199))
(check-sat)

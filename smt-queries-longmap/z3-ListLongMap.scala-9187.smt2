; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110694 () Bool)

(assert start!110694)

(declare-fun b!1308139 () Bool)

(declare-fun e!746493 () Bool)

(declare-fun e!746495 () Bool)

(declare-fun mapRes!54181 () Bool)

(assert (=> b!1308139 (= e!746493 (and e!746495 mapRes!54181))))

(declare-fun condMapEmpty!54181 () Bool)

(declare-datatypes ((V!51817 0))(
  ( (V!51818 (val!17592 Int)) )
))
(declare-datatypes ((ValueCell!16619 0))(
  ( (ValueCellFull!16619 (v!20214 V!51817)) (EmptyCell!16619) )
))
(declare-datatypes ((array!87139 0))(
  ( (array!87140 (arr!42045 (Array (_ BitVec 32) ValueCell!16619)) (size!42596 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87139)

(declare-fun mapDefault!54181 () ValueCell!16619)

(assert (=> b!1308139 (= condMapEmpty!54181 (= (arr!42045 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16619)) mapDefault!54181)))))

(declare-fun b!1308140 () Bool)

(declare-fun tp_is_empty!35035 () Bool)

(assert (=> b!1308140 (= e!746495 tp_is_empty!35035)))

(declare-fun mapIsEmpty!54181 () Bool)

(assert (=> mapIsEmpty!54181 mapRes!54181))

(declare-fun b!1308141 () Bool)

(declare-fun e!746494 () Bool)

(assert (=> b!1308141 (= e!746494 false)))

(declare-fun lt!585461 () Bool)

(declare-datatypes ((array!87141 0))(
  ( (array!87142 (arr!42046 (Array (_ BitVec 32) (_ BitVec 64))) (size!42597 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87141)

(declare-datatypes ((List!29852 0))(
  ( (Nil!29849) (Cons!29848 (h!31066 (_ BitVec 64)) (t!43450 List!29852)) )
))
(declare-fun arrayNoDuplicates!0 (array!87141 (_ BitVec 32) List!29852) Bool)

(assert (=> b!1308141 (= lt!585461 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29849))))

(declare-fun b!1308142 () Bool)

(declare-fun res!868030 () Bool)

(assert (=> b!1308142 (=> (not res!868030) (not e!746494))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87141 (_ BitVec 32)) Bool)

(assert (=> b!1308142 (= res!868030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54181 () Bool)

(declare-fun tp!103261 () Bool)

(declare-fun e!746491 () Bool)

(assert (=> mapNonEmpty!54181 (= mapRes!54181 (and tp!103261 e!746491))))

(declare-fun mapValue!54181 () ValueCell!16619)

(declare-fun mapRest!54181 () (Array (_ BitVec 32) ValueCell!16619))

(declare-fun mapKey!54181 () (_ BitVec 32))

(assert (=> mapNonEmpty!54181 (= (arr!42045 _values!1354) (store mapRest!54181 mapKey!54181 mapValue!54181))))

(declare-fun res!868031 () Bool)

(assert (=> start!110694 (=> (not res!868031) (not e!746494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110694 (= res!868031 (validMask!0 mask!2040))))

(assert (=> start!110694 e!746494))

(assert (=> start!110694 true))

(declare-fun array_inv!32041 (array!87139) Bool)

(assert (=> start!110694 (and (array_inv!32041 _values!1354) e!746493)))

(declare-fun array_inv!32042 (array!87141) Bool)

(assert (=> start!110694 (array_inv!32042 _keys!1628)))

(declare-fun b!1308143 () Bool)

(assert (=> b!1308143 (= e!746491 tp_is_empty!35035)))

(declare-fun b!1308144 () Bool)

(declare-fun res!868029 () Bool)

(assert (=> b!1308144 (=> (not res!868029) (not e!746494))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308144 (= res!868029 (and (= (size!42596 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42597 _keys!1628) (size!42596 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!110694 res!868031) b!1308144))

(assert (= (and b!1308144 res!868029) b!1308142))

(assert (= (and b!1308142 res!868030) b!1308141))

(assert (= (and b!1308139 condMapEmpty!54181) mapIsEmpty!54181))

(assert (= (and b!1308139 (not condMapEmpty!54181)) mapNonEmpty!54181))

(get-info :version)

(assert (= (and mapNonEmpty!54181 ((_ is ValueCellFull!16619) mapValue!54181)) b!1308143))

(assert (= (and b!1308139 ((_ is ValueCellFull!16619) mapDefault!54181)) b!1308140))

(assert (= start!110694 b!1308139))

(declare-fun m!1199339 () Bool)

(assert (=> b!1308141 m!1199339))

(declare-fun m!1199341 () Bool)

(assert (=> b!1308142 m!1199341))

(declare-fun m!1199343 () Bool)

(assert (=> mapNonEmpty!54181 m!1199343))

(declare-fun m!1199345 () Bool)

(assert (=> start!110694 m!1199345))

(declare-fun m!1199347 () Bool)

(assert (=> start!110694 m!1199347))

(declare-fun m!1199349 () Bool)

(assert (=> start!110694 m!1199349))

(check-sat (not mapNonEmpty!54181) tp_is_empty!35035 (not b!1308142) (not start!110694) (not b!1308141))
(check-sat)

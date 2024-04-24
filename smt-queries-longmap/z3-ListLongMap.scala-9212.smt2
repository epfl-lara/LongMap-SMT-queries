; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110844 () Bool)

(assert start!110844)

(declare-fun b_free!29455 () Bool)

(declare-fun b_next!29455 () Bool)

(assert (=> start!110844 (= b_free!29455 (not b_next!29455))))

(declare-fun tp!103687 () Bool)

(declare-fun b_and!47665 () Bool)

(assert (=> start!110844 (= tp!103687 b_and!47665)))

(declare-fun b!1310222 () Bool)

(declare-fun res!869441 () Bool)

(declare-fun e!747620 () Bool)

(assert (=> b!1310222 (=> (not res!869441) (not e!747620))))

(declare-datatypes ((array!87427 0))(
  ( (array!87428 (arr!42189 (Array (_ BitVec 32) (_ BitVec 64))) (size!42740 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87427)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52017 0))(
  ( (V!52018 (val!17667 Int)) )
))
(declare-datatypes ((ValueCell!16694 0))(
  ( (ValueCellFull!16694 (v!20289 V!52017)) (EmptyCell!16694) )
))
(declare-datatypes ((array!87429 0))(
  ( (array!87430 (arr!42190 (Array (_ BitVec 32) ValueCell!16694)) (size!42741 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87429)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310222 (= res!869441 (and (= (size!42741 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42740 _keys!1628) (size!42741 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310223 () Bool)

(assert (=> b!1310223 (= e!747620 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585677 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52017)

(declare-fun zeroValue!1296 () V!52017)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22798 0))(
  ( (tuple2!22799 (_1!11410 (_ BitVec 64)) (_2!11410 V!52017)) )
))
(declare-datatypes ((List!29953 0))(
  ( (Nil!29950) (Cons!29949 (h!31167 tuple2!22798) (t!43551 List!29953)) )
))
(declare-datatypes ((ListLongMap!20463 0))(
  ( (ListLongMap!20464 (toList!10247 List!29953)) )
))
(declare-fun contains!8409 (ListLongMap!20463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5251 (array!87427 array!87429 (_ BitVec 32) (_ BitVec 32) V!52017 V!52017 (_ BitVec 32) Int) ListLongMap!20463)

(assert (=> b!1310223 (= lt!585677 (contains!8409 (getCurrentListMap!5251 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310224 () Bool)

(declare-fun e!747619 () Bool)

(declare-fun tp_is_empty!35185 () Bool)

(assert (=> b!1310224 (= e!747619 tp_is_empty!35185)))

(declare-fun mapIsEmpty!54406 () Bool)

(declare-fun mapRes!54406 () Bool)

(assert (=> mapIsEmpty!54406 mapRes!54406))

(declare-fun mapNonEmpty!54406 () Bool)

(declare-fun tp!103686 () Bool)

(assert (=> mapNonEmpty!54406 (= mapRes!54406 (and tp!103686 e!747619))))

(declare-fun mapKey!54406 () (_ BitVec 32))

(declare-fun mapValue!54406 () ValueCell!16694)

(declare-fun mapRest!54406 () (Array (_ BitVec 32) ValueCell!16694))

(assert (=> mapNonEmpty!54406 (= (arr!42190 _values!1354) (store mapRest!54406 mapKey!54406 mapValue!54406))))

(declare-fun b!1310225 () Bool)

(declare-fun res!869440 () Bool)

(assert (=> b!1310225 (=> (not res!869440) (not e!747620))))

(declare-datatypes ((List!29954 0))(
  ( (Nil!29951) (Cons!29950 (h!31168 (_ BitVec 64)) (t!43552 List!29954)) )
))
(declare-fun arrayNoDuplicates!0 (array!87427 (_ BitVec 32) List!29954) Bool)

(assert (=> b!1310225 (= res!869440 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29951))))

(declare-fun b!1310226 () Bool)

(declare-fun e!747618 () Bool)

(assert (=> b!1310226 (= e!747618 tp_is_empty!35185)))

(declare-fun b!1310227 () Bool)

(declare-fun e!747616 () Bool)

(assert (=> b!1310227 (= e!747616 (and e!747618 mapRes!54406))))

(declare-fun condMapEmpty!54406 () Bool)

(declare-fun mapDefault!54406 () ValueCell!16694)

(assert (=> b!1310227 (= condMapEmpty!54406 (= (arr!42190 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16694)) mapDefault!54406)))))

(declare-fun b!1310228 () Bool)

(declare-fun res!869437 () Bool)

(assert (=> b!1310228 (=> (not res!869437) (not e!747620))))

(assert (=> b!1310228 (= res!869437 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42740 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310229 () Bool)

(declare-fun res!869439 () Bool)

(assert (=> b!1310229 (=> (not res!869439) (not e!747620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87427 (_ BitVec 32)) Bool)

(assert (=> b!1310229 (= res!869439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869438 () Bool)

(assert (=> start!110844 (=> (not res!869438) (not e!747620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110844 (= res!869438 (validMask!0 mask!2040))))

(assert (=> start!110844 e!747620))

(assert (=> start!110844 tp!103687))

(declare-fun array_inv!32147 (array!87427) Bool)

(assert (=> start!110844 (array_inv!32147 _keys!1628)))

(assert (=> start!110844 true))

(assert (=> start!110844 tp_is_empty!35185))

(declare-fun array_inv!32148 (array!87429) Bool)

(assert (=> start!110844 (and (array_inv!32148 _values!1354) e!747616)))

(assert (= (and start!110844 res!869438) b!1310222))

(assert (= (and b!1310222 res!869441) b!1310229))

(assert (= (and b!1310229 res!869439) b!1310225))

(assert (= (and b!1310225 res!869440) b!1310228))

(assert (= (and b!1310228 res!869437) b!1310223))

(assert (= (and b!1310227 condMapEmpty!54406) mapIsEmpty!54406))

(assert (= (and b!1310227 (not condMapEmpty!54406)) mapNonEmpty!54406))

(get-info :version)

(assert (= (and mapNonEmpty!54406 ((_ is ValueCellFull!16694) mapValue!54406)) b!1310224))

(assert (= (and b!1310227 ((_ is ValueCellFull!16694) mapDefault!54406)) b!1310226))

(assert (= start!110844 b!1310227))

(declare-fun m!1200773 () Bool)

(assert (=> b!1310229 m!1200773))

(declare-fun m!1200775 () Bool)

(assert (=> mapNonEmpty!54406 m!1200775))

(declare-fun m!1200777 () Bool)

(assert (=> b!1310223 m!1200777))

(assert (=> b!1310223 m!1200777))

(declare-fun m!1200779 () Bool)

(assert (=> b!1310223 m!1200779))

(declare-fun m!1200781 () Bool)

(assert (=> start!110844 m!1200781))

(declare-fun m!1200783 () Bool)

(assert (=> start!110844 m!1200783))

(declare-fun m!1200785 () Bool)

(assert (=> start!110844 m!1200785))

(declare-fun m!1200787 () Bool)

(assert (=> b!1310225 m!1200787))

(check-sat (not mapNonEmpty!54406) tp_is_empty!35185 (not b!1310225) b_and!47665 (not b_next!29455) (not start!110844) (not b!1310223) (not b!1310229))
(check-sat b_and!47665 (not b_next!29455))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110832 () Bool)

(assert start!110832)

(declare-fun b_free!29667 () Bool)

(declare-fun b_next!29667 () Bool)

(assert (=> start!110832 (= b_free!29667 (not b_next!29667))))

(declare-fun tp!104322 () Bool)

(declare-fun b_and!47875 () Bool)

(assert (=> start!110832 (= tp!104322 b_and!47875)))

(declare-fun mapNonEmpty!54724 () Bool)

(declare-fun mapRes!54724 () Bool)

(declare-fun tp!104323 () Bool)

(declare-fun e!748366 () Bool)

(assert (=> mapNonEmpty!54724 (= mapRes!54724 (and tp!104323 e!748366))))

(declare-fun mapKey!54724 () (_ BitVec 32))

(declare-datatypes ((V!52299 0))(
  ( (V!52300 (val!17773 Int)) )
))
(declare-datatypes ((ValueCell!16800 0))(
  ( (ValueCellFull!16800 (v!20400 V!52299)) (EmptyCell!16800) )
))
(declare-datatypes ((array!87782 0))(
  ( (array!87783 (arr!42371 (Array (_ BitVec 32) ValueCell!16800)) (size!42921 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87782)

(declare-fun mapRest!54724 () (Array (_ BitVec 32) ValueCell!16800))

(declare-fun mapValue!54724 () ValueCell!16800)

(assert (=> mapNonEmpty!54724 (= (arr!42371 _values!1354) (store mapRest!54724 mapKey!54724 mapValue!54724))))

(declare-fun b!1311919 () Bool)

(declare-fun res!870964 () Bool)

(declare-fun e!748367 () Bool)

(assert (=> b!1311919 (=> (not res!870964) (not e!748367))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311919 (= res!870964 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311920 () Bool)

(declare-fun res!870961 () Bool)

(assert (=> b!1311920 (=> (not res!870961) (not e!748367))))

(declare-datatypes ((array!87784 0))(
  ( (array!87785 (arr!42372 (Array (_ BitVec 32) (_ BitVec 64))) (size!42922 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87784)

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1311920 (= res!870961 (and (= (size!42921 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42922 _keys!1628) (size!42921 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311921 () Bool)

(declare-fun e!748364 () Bool)

(declare-fun tp_is_empty!35397 () Bool)

(assert (=> b!1311921 (= e!748364 tp_is_empty!35397)))

(declare-fun mapIsEmpty!54724 () Bool)

(assert (=> mapIsEmpty!54724 mapRes!54724))

(declare-fun b!1311922 () Bool)

(declare-fun e!748365 () Bool)

(assert (=> b!1311922 (= e!748365 (and e!748364 mapRes!54724))))

(declare-fun condMapEmpty!54724 () Bool)

(declare-fun mapDefault!54724 () ValueCell!16800)

(assert (=> b!1311922 (= condMapEmpty!54724 (= (arr!42371 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16800)) mapDefault!54724)))))

(declare-fun b!1311923 () Bool)

(assert (=> b!1311923 (= e!748367 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52299)

(declare-fun zeroValue!1296 () V!52299)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22908 0))(
  ( (tuple2!22909 (_1!11465 (_ BitVec 64)) (_2!11465 V!52299)) )
))
(declare-datatypes ((List!30046 0))(
  ( (Nil!30043) (Cons!30042 (h!31251 tuple2!22908) (t!43652 List!30046)) )
))
(declare-datatypes ((ListLongMap!20565 0))(
  ( (ListLongMap!20566 (toList!10298 List!30046)) )
))
(declare-fun contains!8448 (ListLongMap!20565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5311 (array!87784 array!87782 (_ BitVec 32) (_ BitVec 32) V!52299 V!52299 (_ BitVec 32) Int) ListLongMap!20565)

(assert (=> b!1311923 (contains!8448 (getCurrentListMap!5311 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43362 0))(
  ( (Unit!43363) )
))
(declare-fun lt!585519 () Unit!43362)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 (array!87784 array!87782 (_ BitVec 32) (_ BitVec 32) V!52299 V!52299 (_ BitVec 64) (_ BitVec 32) Int) Unit!43362)

(assert (=> b!1311923 (= lt!585519 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!8 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311924 () Bool)

(declare-fun res!870963 () Bool)

(assert (=> b!1311924 (=> (not res!870963) (not e!748367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87784 (_ BitVec 32)) Bool)

(assert (=> b!1311924 (= res!870963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311925 () Bool)

(declare-fun res!870962 () Bool)

(assert (=> b!1311925 (=> (not res!870962) (not e!748367))))

(declare-datatypes ((List!30047 0))(
  ( (Nil!30044) (Cons!30043 (h!31252 (_ BitVec 64)) (t!43653 List!30047)) )
))
(declare-fun arrayNoDuplicates!0 (array!87784 (_ BitVec 32) List!30047) Bool)

(assert (=> b!1311925 (= res!870962 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30044))))

(declare-fun b!1311926 () Bool)

(assert (=> b!1311926 (= e!748366 tp_is_empty!35397)))

(declare-fun res!870965 () Bool)

(assert (=> start!110832 (=> (not res!870965) (not e!748367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110832 (= res!870965 (validMask!0 mask!2040))))

(assert (=> start!110832 e!748367))

(assert (=> start!110832 tp!104322))

(declare-fun array_inv!32021 (array!87784) Bool)

(assert (=> start!110832 (array_inv!32021 _keys!1628)))

(assert (=> start!110832 true))

(assert (=> start!110832 tp_is_empty!35397))

(declare-fun array_inv!32022 (array!87782) Bool)

(assert (=> start!110832 (and (array_inv!32022 _values!1354) e!748365)))

(declare-fun b!1311927 () Bool)

(declare-fun res!870967 () Bool)

(assert (=> b!1311927 (=> (not res!870967) (not e!748367))))

(assert (=> b!1311927 (= res!870967 (not (= (select (arr!42372 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1311928 () Bool)

(declare-fun res!870966 () Bool)

(assert (=> b!1311928 (=> (not res!870966) (not e!748367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311928 (= res!870966 (validKeyInArray!0 (select (arr!42372 _keys!1628) from!2020)))))

(declare-fun b!1311929 () Bool)

(declare-fun res!870969 () Bool)

(assert (=> b!1311929 (=> (not res!870969) (not e!748367))))

(assert (=> b!1311929 (= res!870969 (contains!8448 (getCurrentListMap!5311 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1311930 () Bool)

(declare-fun res!870968 () Bool)

(assert (=> b!1311930 (=> (not res!870968) (not e!748367))))

(assert (=> b!1311930 (= res!870968 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42922 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110832 res!870965) b!1311920))

(assert (= (and b!1311920 res!870961) b!1311924))

(assert (= (and b!1311924 res!870963) b!1311925))

(assert (= (and b!1311925 res!870962) b!1311930))

(assert (= (and b!1311930 res!870968) b!1311929))

(assert (= (and b!1311929 res!870969) b!1311927))

(assert (= (and b!1311927 res!870967) b!1311928))

(assert (= (and b!1311928 res!870966) b!1311919))

(assert (= (and b!1311919 res!870964) b!1311923))

(assert (= (and b!1311922 condMapEmpty!54724) mapIsEmpty!54724))

(assert (= (and b!1311922 (not condMapEmpty!54724)) mapNonEmpty!54724))

(get-info :version)

(assert (= (and mapNonEmpty!54724 ((_ is ValueCellFull!16800) mapValue!54724)) b!1311926))

(assert (= (and b!1311922 ((_ is ValueCellFull!16800) mapDefault!54724)) b!1311921))

(assert (= start!110832 b!1311922))

(declare-fun m!1201241 () Bool)

(assert (=> b!1311928 m!1201241))

(assert (=> b!1311928 m!1201241))

(declare-fun m!1201243 () Bool)

(assert (=> b!1311928 m!1201243))

(declare-fun m!1201245 () Bool)

(assert (=> b!1311924 m!1201245))

(declare-fun m!1201247 () Bool)

(assert (=> b!1311929 m!1201247))

(assert (=> b!1311929 m!1201247))

(declare-fun m!1201249 () Bool)

(assert (=> b!1311929 m!1201249))

(declare-fun m!1201251 () Bool)

(assert (=> b!1311925 m!1201251))

(declare-fun m!1201253 () Bool)

(assert (=> b!1311923 m!1201253))

(assert (=> b!1311923 m!1201253))

(declare-fun m!1201255 () Bool)

(assert (=> b!1311923 m!1201255))

(declare-fun m!1201257 () Bool)

(assert (=> b!1311923 m!1201257))

(assert (=> b!1311927 m!1201241))

(declare-fun m!1201259 () Bool)

(assert (=> mapNonEmpty!54724 m!1201259))

(declare-fun m!1201261 () Bool)

(assert (=> start!110832 m!1201261))

(declare-fun m!1201263 () Bool)

(assert (=> start!110832 m!1201263))

(declare-fun m!1201265 () Bool)

(assert (=> start!110832 m!1201265))

(check-sat (not b!1311925) (not b_next!29667) b_and!47875 (not b!1311924) (not start!110832) (not mapNonEmpty!54724) (not b!1311923) (not b!1311928) (not b!1311929) tp_is_empty!35397)
(check-sat b_and!47875 (not b_next!29667))

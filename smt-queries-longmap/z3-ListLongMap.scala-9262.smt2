; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110922 () Bool)

(assert start!110922)

(declare-fun b_free!29757 () Bool)

(declare-fun b_next!29757 () Bool)

(assert (=> start!110922 (= b_free!29757 (not b_next!29757))))

(declare-fun tp!104593 () Bool)

(declare-fun b_and!47965 () Bool)

(assert (=> start!110922 (= tp!104593 b_and!47965)))

(declare-fun b!1313222 () Bool)

(declare-fun e!749039 () Bool)

(declare-fun e!749038 () Bool)

(declare-fun mapRes!54859 () Bool)

(assert (=> b!1313222 (= e!749039 (and e!749038 mapRes!54859))))

(declare-fun condMapEmpty!54859 () Bool)

(declare-datatypes ((V!52419 0))(
  ( (V!52420 (val!17818 Int)) )
))
(declare-datatypes ((ValueCell!16845 0))(
  ( (ValueCellFull!16845 (v!20445 V!52419)) (EmptyCell!16845) )
))
(declare-datatypes ((array!87956 0))(
  ( (array!87957 (arr!42458 (Array (_ BitVec 32) ValueCell!16845)) (size!43008 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87956)

(declare-fun mapDefault!54859 () ValueCell!16845)

(assert (=> b!1313222 (= condMapEmpty!54859 (= (arr!42458 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16845)) mapDefault!54859)))))

(declare-fun mapIsEmpty!54859 () Bool)

(assert (=> mapIsEmpty!54859 mapRes!54859))

(declare-fun b!1313223 () Bool)

(declare-fun tp_is_empty!35487 () Bool)

(assert (=> b!1313223 (= e!749038 tp_is_empty!35487)))

(declare-fun b!1313224 () Bool)

(declare-fun e!749040 () Bool)

(assert (=> b!1313224 (= e!749040 tp_is_empty!35487)))

(declare-fun b!1313225 () Bool)

(declare-fun e!749042 () Bool)

(assert (=> b!1313225 (= e!749042 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87958 0))(
  ( (array!87959 (arr!42459 (Array (_ BitVec 32) (_ BitVec 64))) (size!43009 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87958)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52419)

(declare-fun zeroValue!1296 () V!52419)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585645 () Bool)

(declare-datatypes ((tuple2!22974 0))(
  ( (tuple2!22975 (_1!11498 (_ BitVec 64)) (_2!11498 V!52419)) )
))
(declare-datatypes ((List!30109 0))(
  ( (Nil!30106) (Cons!30105 (h!31314 tuple2!22974) (t!43715 List!30109)) )
))
(declare-datatypes ((ListLongMap!20631 0))(
  ( (ListLongMap!20632 (toList!10331 List!30109)) )
))
(declare-fun contains!8481 (ListLongMap!20631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5344 (array!87958 array!87956 (_ BitVec 32) (_ BitVec 32) V!52419 V!52419 (_ BitVec 32) Int) ListLongMap!20631)

(assert (=> b!1313225 (= lt!585645 (contains!8481 (getCurrentListMap!5344 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313226 () Bool)

(declare-fun res!871861 () Bool)

(assert (=> b!1313226 (=> (not res!871861) (not e!749042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87958 (_ BitVec 32)) Bool)

(assert (=> b!1313226 (= res!871861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313227 () Bool)

(declare-fun res!871859 () Bool)

(assert (=> b!1313227 (=> (not res!871859) (not e!749042))))

(assert (=> b!1313227 (= res!871859 (and (= (size!43008 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43009 _keys!1628) (size!43008 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!871863 () Bool)

(assert (=> start!110922 (=> (not res!871863) (not e!749042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110922 (= res!871863 (validMask!0 mask!2040))))

(assert (=> start!110922 e!749042))

(assert (=> start!110922 tp!104593))

(declare-fun array_inv!32073 (array!87958) Bool)

(assert (=> start!110922 (array_inv!32073 _keys!1628)))

(assert (=> start!110922 true))

(assert (=> start!110922 tp_is_empty!35487))

(declare-fun array_inv!32074 (array!87956) Bool)

(assert (=> start!110922 (and (array_inv!32074 _values!1354) e!749039)))

(declare-fun b!1313228 () Bool)

(declare-fun res!871862 () Bool)

(assert (=> b!1313228 (=> (not res!871862) (not e!749042))))

(declare-datatypes ((List!30110 0))(
  ( (Nil!30107) (Cons!30106 (h!31315 (_ BitVec 64)) (t!43716 List!30110)) )
))
(declare-fun arrayNoDuplicates!0 (array!87958 (_ BitVec 32) List!30110) Bool)

(assert (=> b!1313228 (= res!871862 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30107))))

(declare-fun mapNonEmpty!54859 () Bool)

(declare-fun tp!104592 () Bool)

(assert (=> mapNonEmpty!54859 (= mapRes!54859 (and tp!104592 e!749040))))

(declare-fun mapValue!54859 () ValueCell!16845)

(declare-fun mapKey!54859 () (_ BitVec 32))

(declare-fun mapRest!54859 () (Array (_ BitVec 32) ValueCell!16845))

(assert (=> mapNonEmpty!54859 (= (arr!42458 _values!1354) (store mapRest!54859 mapKey!54859 mapValue!54859))))

(declare-fun b!1313229 () Bool)

(declare-fun res!871860 () Bool)

(assert (=> b!1313229 (=> (not res!871860) (not e!749042))))

(assert (=> b!1313229 (= res!871860 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43009 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!110922 res!871863) b!1313227))

(assert (= (and b!1313227 res!871859) b!1313226))

(assert (= (and b!1313226 res!871861) b!1313228))

(assert (= (and b!1313228 res!871862) b!1313229))

(assert (= (and b!1313229 res!871860) b!1313225))

(assert (= (and b!1313222 condMapEmpty!54859) mapIsEmpty!54859))

(assert (= (and b!1313222 (not condMapEmpty!54859)) mapNonEmpty!54859))

(get-info :version)

(assert (= (and mapNonEmpty!54859 ((_ is ValueCellFull!16845) mapValue!54859)) b!1313224))

(assert (= (and b!1313222 ((_ is ValueCellFull!16845) mapDefault!54859)) b!1313223))

(assert (= start!110922 b!1313222))

(declare-fun m!1202143 () Bool)

(assert (=> b!1313228 m!1202143))

(declare-fun m!1202145 () Bool)

(assert (=> b!1313225 m!1202145))

(assert (=> b!1313225 m!1202145))

(declare-fun m!1202147 () Bool)

(assert (=> b!1313225 m!1202147))

(declare-fun m!1202149 () Bool)

(assert (=> start!110922 m!1202149))

(declare-fun m!1202151 () Bool)

(assert (=> start!110922 m!1202151))

(declare-fun m!1202153 () Bool)

(assert (=> start!110922 m!1202153))

(declare-fun m!1202155 () Bool)

(assert (=> b!1313226 m!1202155))

(declare-fun m!1202157 () Bool)

(assert (=> mapNonEmpty!54859 m!1202157))

(check-sat (not mapNonEmpty!54859) (not b!1313225) (not b!1313228) tp_is_empty!35487 (not start!110922) b_and!47965 (not b!1313226) (not b_next!29757))
(check-sat b_and!47965 (not b_next!29757))

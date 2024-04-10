; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79296 () Bool)

(assert start!79296)

(declare-fun b_free!17509 () Bool)

(declare-fun b_next!17509 () Bool)

(assert (=> start!79296 (= b_free!17509 (not b_next!17509))))

(declare-fun tp!60968 () Bool)

(declare-fun b_and!28575 () Bool)

(assert (=> start!79296 (= tp!60968 b_and!28575)))

(declare-fun b!931284 () Bool)

(declare-fun e!523004 () Bool)

(declare-fun e!523007 () Bool)

(assert (=> b!931284 (= e!523004 e!523007)))

(declare-fun res!627188 () Bool)

(assert (=> b!931284 (=> (not res!627188) (not e!523007))))

(declare-datatypes ((V!31655 0))(
  ( (V!31656 (val!10059 Int)) )
))
(declare-datatypes ((tuple2!13176 0))(
  ( (tuple2!13177 (_1!6599 (_ BitVec 64)) (_2!6599 V!31655)) )
))
(declare-datatypes ((List!18961 0))(
  ( (Nil!18958) (Cons!18957 (h!20103 tuple2!13176) (t!27018 List!18961)) )
))
(declare-datatypes ((ListLongMap!11873 0))(
  ( (ListLongMap!11874 (toList!5952 List!18961)) )
))
(declare-fun lt!419398 () ListLongMap!11873)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4999 (ListLongMap!11873 (_ BitVec 64)) Bool)

(assert (=> b!931284 (= res!627188 (contains!4999 lt!419398 k!1099))))

(declare-datatypes ((array!55974 0))(
  ( (array!55975 (arr!26932 (Array (_ BitVec 32) (_ BitVec 64))) (size!27391 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55974)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9527 0))(
  ( (ValueCellFull!9527 (v!12577 V!31655)) (EmptyCell!9527) )
))
(declare-datatypes ((array!55976 0))(
  ( (array!55977 (arr!26933 (Array (_ BitVec 32) ValueCell!9527)) (size!27392 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55976)

(declare-fun zeroValue!1173 () V!31655)

(declare-fun minValue!1173 () V!31655)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3190 (array!55974 array!55976 (_ BitVec 32) (_ BitVec 32) V!31655 V!31655 (_ BitVec 32) Int) ListLongMap!11873)

(assert (=> b!931284 (= lt!419398 (getCurrentListMap!3190 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931285 () Bool)

(declare-fun e!523008 () Bool)

(declare-fun tp_is_empty!20017 () Bool)

(assert (=> b!931285 (= e!523008 tp_is_empty!20017)))

(declare-fun mapNonEmpty!31782 () Bool)

(declare-fun mapRes!31782 () Bool)

(declare-fun tp!60967 () Bool)

(assert (=> mapNonEmpty!31782 (= mapRes!31782 (and tp!60967 e!523008))))

(declare-fun mapValue!31782 () ValueCell!9527)

(declare-fun mapKey!31782 () (_ BitVec 32))

(declare-fun mapRest!31782 () (Array (_ BitVec 32) ValueCell!9527))

(assert (=> mapNonEmpty!31782 (= (arr!26933 _values!1231) (store mapRest!31782 mapKey!31782 mapValue!31782))))

(declare-fun b!931286 () Bool)

(declare-fun res!627190 () Bool)

(assert (=> b!931286 (=> (not res!627190) (not e!523004))))

(assert (=> b!931286 (= res!627190 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27391 _keys!1487))))))

(declare-fun b!931287 () Bool)

(declare-fun res!627192 () Bool)

(assert (=> b!931287 (=> (not res!627192) (not e!523004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55974 (_ BitVec 32)) Bool)

(assert (=> b!931287 (= res!627192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!627193 () Bool)

(assert (=> start!79296 (=> (not res!627193) (not e!523004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79296 (= res!627193 (validMask!0 mask!1881))))

(assert (=> start!79296 e!523004))

(assert (=> start!79296 true))

(declare-fun e!523005 () Bool)

(declare-fun array_inv!20964 (array!55976) Bool)

(assert (=> start!79296 (and (array_inv!20964 _values!1231) e!523005)))

(assert (=> start!79296 tp!60968))

(declare-fun array_inv!20965 (array!55974) Bool)

(assert (=> start!79296 (array_inv!20965 _keys!1487)))

(assert (=> start!79296 tp_is_empty!20017))

(declare-fun mapIsEmpty!31782 () Bool)

(assert (=> mapIsEmpty!31782 mapRes!31782))

(declare-fun b!931288 () Bool)

(declare-fun res!627191 () Bool)

(assert (=> b!931288 (=> (not res!627191) (not e!523004))))

(declare-datatypes ((List!18962 0))(
  ( (Nil!18959) (Cons!18958 (h!20104 (_ BitVec 64)) (t!27019 List!18962)) )
))
(declare-fun arrayNoDuplicates!0 (array!55974 (_ BitVec 32) List!18962) Bool)

(assert (=> b!931288 (= res!627191 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18959))))

(declare-fun b!931289 () Bool)

(declare-fun e!523009 () Bool)

(assert (=> b!931289 (= e!523005 (and e!523009 mapRes!31782))))

(declare-fun condMapEmpty!31782 () Bool)

(declare-fun mapDefault!31782 () ValueCell!9527)


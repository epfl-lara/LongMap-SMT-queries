; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74290 () Bool)

(assert start!74290)

(declare-fun b!872887 () Bool)

(declare-fun res!593040 () Bool)

(declare-fun e!486093 () Bool)

(assert (=> b!872887 (=> (not res!593040) (not e!486093))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872887 (= res!593040 (validMask!0 mask!1196))))

(declare-fun b!872888 () Bool)

(declare-fun res!593041 () Bool)

(assert (=> b!872888 (=> (not res!593041) (not e!486093))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50519 0))(
  ( (array!50520 (arr!24285 (Array (_ BitVec 32) (_ BitVec 64))) (size!24726 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50519)

(declare-datatypes ((V!27929 0))(
  ( (V!27930 (val!8628 Int)) )
))
(declare-datatypes ((ValueCell!8141 0))(
  ( (ValueCellFull!8141 (v!11053 V!27929)) (EmptyCell!8141) )
))
(declare-datatypes ((array!50521 0))(
  ( (array!50522 (arr!24286 (Array (_ BitVec 32) ValueCell!8141)) (size!24727 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50521)

(assert (=> b!872888 (= res!593041 (and (= (size!24727 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24726 _keys!868) (size!24727 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27344 () Bool)

(declare-fun mapRes!27344 () Bool)

(assert (=> mapIsEmpty!27344 mapRes!27344))

(declare-fun b!872889 () Bool)

(declare-fun e!486094 () Bool)

(declare-fun tp_is_empty!17161 () Bool)

(assert (=> b!872889 (= e!486094 tp_is_empty!17161)))

(declare-fun res!593039 () Bool)

(assert (=> start!74290 (=> (not res!593039) (not e!486093))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74290 (= res!593039 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24726 _keys!868))))))

(assert (=> start!74290 e!486093))

(assert (=> start!74290 true))

(declare-fun array_inv!19224 (array!50519) Bool)

(assert (=> start!74290 (array_inv!19224 _keys!868)))

(declare-fun e!486097 () Bool)

(declare-fun array_inv!19225 (array!50521) Bool)

(assert (=> start!74290 (and (array_inv!19225 _values!688) e!486097)))

(declare-fun b!872890 () Bool)

(assert (=> b!872890 (= e!486093 false)))

(declare-fun lt!395918 () Bool)

(declare-datatypes ((List!17202 0))(
  ( (Nil!17199) (Cons!17198 (h!18335 (_ BitVec 64)) (t!24231 List!17202)) )
))
(declare-fun arrayNoDuplicates!0 (array!50519 (_ BitVec 32) List!17202) Bool)

(assert (=> b!872890 (= lt!395918 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17199))))

(declare-fun b!872891 () Bool)

(declare-fun res!593038 () Bool)

(assert (=> b!872891 (=> (not res!593038) (not e!486093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50519 (_ BitVec 32)) Bool)

(assert (=> b!872891 (= res!593038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27344 () Bool)

(declare-fun tp!52544 () Bool)

(assert (=> mapNonEmpty!27344 (= mapRes!27344 (and tp!52544 e!486094))))

(declare-fun mapKey!27344 () (_ BitVec 32))

(declare-fun mapValue!27344 () ValueCell!8141)

(declare-fun mapRest!27344 () (Array (_ BitVec 32) ValueCell!8141))

(assert (=> mapNonEmpty!27344 (= (arr!24286 _values!688) (store mapRest!27344 mapKey!27344 mapValue!27344))))

(declare-fun b!872892 () Bool)

(declare-fun e!486096 () Bool)

(assert (=> b!872892 (= e!486096 tp_is_empty!17161)))

(declare-fun b!872893 () Bool)

(assert (=> b!872893 (= e!486097 (and e!486096 mapRes!27344))))

(declare-fun condMapEmpty!27344 () Bool)

(declare-fun mapDefault!27344 () ValueCell!8141)

(assert (=> b!872893 (= condMapEmpty!27344 (= (arr!24286 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8141)) mapDefault!27344)))))

(assert (= (and start!74290 res!593039) b!872887))

(assert (= (and b!872887 res!593040) b!872888))

(assert (= (and b!872888 res!593041) b!872891))

(assert (= (and b!872891 res!593038) b!872890))

(assert (= (and b!872893 condMapEmpty!27344) mapIsEmpty!27344))

(assert (= (and b!872893 (not condMapEmpty!27344)) mapNonEmpty!27344))

(get-info :version)

(assert (= (and mapNonEmpty!27344 ((_ is ValueCellFull!8141) mapValue!27344)) b!872889))

(assert (= (and b!872893 ((_ is ValueCellFull!8141) mapDefault!27344)) b!872892))

(assert (= start!74290 b!872893))

(declare-fun m!814289 () Bool)

(assert (=> b!872890 m!814289))

(declare-fun m!814291 () Bool)

(assert (=> b!872891 m!814291))

(declare-fun m!814293 () Bool)

(assert (=> start!74290 m!814293))

(declare-fun m!814295 () Bool)

(assert (=> start!74290 m!814295))

(declare-fun m!814297 () Bool)

(assert (=> mapNonEmpty!27344 m!814297))

(declare-fun m!814299 () Bool)

(assert (=> b!872887 m!814299))

(check-sat (not mapNonEmpty!27344) (not b!872891) (not b!872890) tp_is_empty!17161 (not b!872887) (not start!74290))
(check-sat)

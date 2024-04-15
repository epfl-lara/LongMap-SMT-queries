; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83154 () Bool)

(assert start!83154)

(declare-fun b_free!19165 () Bool)

(declare-fun b_next!19165 () Bool)

(assert (=> start!83154 (= b_free!19165 (not b_next!19165))))

(declare-fun tp!66775 () Bool)

(declare-fun b_and!30627 () Bool)

(assert (=> start!83154 (= tp!66775 b_and!30627)))

(declare-fun b!970092 () Bool)

(declare-fun res!649347 () Bool)

(declare-fun e!546889 () Bool)

(assert (=> b!970092 (=> (not res!649347) (not e!546889))))

(declare-datatypes ((array!60116 0))(
  ( (array!60117 (arr!28922 (Array (_ BitVec 32) (_ BitVec 64))) (size!29403 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60116)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970092 (= res!649347 (validKeyInArray!0 (select (arr!28922 _keys!1717) i!822)))))

(declare-fun res!649350 () Bool)

(assert (=> start!83154 (=> (not res!649350) (not e!546889))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83154 (= res!649350 (validMask!0 mask!2147))))

(assert (=> start!83154 e!546889))

(assert (=> start!83154 true))

(declare-datatypes ((V!34401 0))(
  ( (V!34402 (val!11082 Int)) )
))
(declare-datatypes ((ValueCell!10550 0))(
  ( (ValueCellFull!10550 (v!13640 V!34401)) (EmptyCell!10550) )
))
(declare-datatypes ((array!60118 0))(
  ( (array!60119 (arr!28923 (Array (_ BitVec 32) ValueCell!10550)) (size!29404 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60118)

(declare-fun e!546891 () Bool)

(declare-fun array_inv!22449 (array!60118) Bool)

(assert (=> start!83154 (and (array_inv!22449 _values!1425) e!546891)))

(declare-fun tp_is_empty!22063 () Bool)

(assert (=> start!83154 tp_is_empty!22063))

(assert (=> start!83154 tp!66775))

(declare-fun array_inv!22450 (array!60116) Bool)

(assert (=> start!83154 (array_inv!22450 _keys!1717)))

(declare-fun b!970093 () Bool)

(declare-fun res!649346 () Bool)

(assert (=> b!970093 (=> (not res!649346) (not e!546889))))

(declare-datatypes ((List!20101 0))(
  ( (Nil!20098) (Cons!20097 (h!21259 (_ BitVec 64)) (t!28455 List!20101)) )
))
(declare-fun arrayNoDuplicates!0 (array!60116 (_ BitVec 32) List!20101) Bool)

(assert (=> b!970093 (= res!649346 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20098))))

(declare-fun b!970094 () Bool)

(declare-fun e!546888 () Bool)

(declare-fun mapRes!35104 () Bool)

(assert (=> b!970094 (= e!546891 (and e!546888 mapRes!35104))))

(declare-fun condMapEmpty!35104 () Bool)

(declare-fun mapDefault!35104 () ValueCell!10550)

(assert (=> b!970094 (= condMapEmpty!35104 (= (arr!28923 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10550)) mapDefault!35104)))))

(declare-fun b!970095 () Bool)

(assert (=> b!970095 (= e!546888 tp_is_empty!22063)))

(declare-fun b!970096 () Bool)

(declare-fun res!649349 () Bool)

(assert (=> b!970096 (=> (not res!649349) (not e!546889))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!970096 (= res!649349 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29403 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29403 _keys!1717))))))

(declare-fun b!970097 () Bool)

(declare-fun res!649348 () Bool)

(assert (=> b!970097 (=> (not res!649348) (not e!546889))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970097 (= res!649348 (and (= (size!29404 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29403 _keys!1717) (size!29404 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970098 () Bool)

(assert (=> b!970098 (= e!546889 false)))

(declare-fun lt!431490 () Bool)

(declare-fun zeroValue!1367 () V!34401)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34401)

(declare-datatypes ((tuple2!14280 0))(
  ( (tuple2!14281 (_1!7151 (_ BitVec 64)) (_2!7151 V!34401)) )
))
(declare-datatypes ((List!20102 0))(
  ( (Nil!20099) (Cons!20098 (h!21260 tuple2!14280) (t!28456 List!20102)) )
))
(declare-datatypes ((ListLongMap!12967 0))(
  ( (ListLongMap!12968 (toList!6499 List!20102)) )
))
(declare-fun contains!5547 (ListLongMap!12967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3661 (array!60116 array!60118 (_ BitVec 32) (_ BitVec 32) V!34401 V!34401 (_ BitVec 32) Int) ListLongMap!12967)

(assert (=> b!970098 (= lt!431490 (contains!5547 (getCurrentListMap!3661 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28922 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35104 () Bool)

(declare-fun tp!66774 () Bool)

(declare-fun e!546887 () Bool)

(assert (=> mapNonEmpty!35104 (= mapRes!35104 (and tp!66774 e!546887))))

(declare-fun mapValue!35104 () ValueCell!10550)

(declare-fun mapRest!35104 () (Array (_ BitVec 32) ValueCell!10550))

(declare-fun mapKey!35104 () (_ BitVec 32))

(assert (=> mapNonEmpty!35104 (= (arr!28923 _values!1425) (store mapRest!35104 mapKey!35104 mapValue!35104))))

(declare-fun b!970099 () Bool)

(assert (=> b!970099 (= e!546887 tp_is_empty!22063)))

(declare-fun mapIsEmpty!35104 () Bool)

(assert (=> mapIsEmpty!35104 mapRes!35104))

(declare-fun b!970100 () Bool)

(declare-fun res!649351 () Bool)

(assert (=> b!970100 (=> (not res!649351) (not e!546889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60116 (_ BitVec 32)) Bool)

(assert (=> b!970100 (= res!649351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83154 res!649350) b!970097))

(assert (= (and b!970097 res!649348) b!970100))

(assert (= (and b!970100 res!649351) b!970093))

(assert (= (and b!970093 res!649346) b!970096))

(assert (= (and b!970096 res!649349) b!970092))

(assert (= (and b!970092 res!649347) b!970098))

(assert (= (and b!970094 condMapEmpty!35104) mapIsEmpty!35104))

(assert (= (and b!970094 (not condMapEmpty!35104)) mapNonEmpty!35104))

(get-info :version)

(assert (= (and mapNonEmpty!35104 ((_ is ValueCellFull!10550) mapValue!35104)) b!970099))

(assert (= (and b!970094 ((_ is ValueCellFull!10550) mapDefault!35104)) b!970095))

(assert (= start!83154 b!970094))

(declare-fun m!897329 () Bool)

(assert (=> mapNonEmpty!35104 m!897329))

(declare-fun m!897331 () Bool)

(assert (=> b!970098 m!897331))

(declare-fun m!897333 () Bool)

(assert (=> b!970098 m!897333))

(assert (=> b!970098 m!897331))

(assert (=> b!970098 m!897333))

(declare-fun m!897335 () Bool)

(assert (=> b!970098 m!897335))

(declare-fun m!897337 () Bool)

(assert (=> start!83154 m!897337))

(declare-fun m!897339 () Bool)

(assert (=> start!83154 m!897339))

(declare-fun m!897341 () Bool)

(assert (=> start!83154 m!897341))

(declare-fun m!897343 () Bool)

(assert (=> b!970100 m!897343))

(declare-fun m!897345 () Bool)

(assert (=> b!970093 m!897345))

(assert (=> b!970092 m!897333))

(assert (=> b!970092 m!897333))

(declare-fun m!897347 () Bool)

(assert (=> b!970092 m!897347))

(check-sat tp_is_empty!22063 (not b!970093) (not b_next!19165) (not start!83154) (not b!970092) (not b!970100) (not mapNonEmpty!35104) (not b!970098) b_and!30627)
(check-sat b_and!30627 (not b_next!19165))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20294 () Bool)

(assert start!20294)

(declare-fun b_free!4953 () Bool)

(declare-fun b_next!4953 () Bool)

(assert (=> start!20294 (= b_free!4953 (not b_next!4953))))

(declare-fun tp!17890 () Bool)

(declare-fun b_and!11699 () Bool)

(assert (=> start!20294 (= tp!17890 b_and!11699)))

(declare-fun b!199844 () Bool)

(declare-fun e!131125 () Bool)

(declare-fun e!131128 () Bool)

(declare-fun mapRes!8282 () Bool)

(assert (=> b!199844 (= e!131125 (and e!131128 mapRes!8282))))

(declare-fun condMapEmpty!8282 () Bool)

(declare-datatypes ((V!6059 0))(
  ( (V!6060 (val!2449 Int)) )
))
(declare-datatypes ((ValueCell!2061 0))(
  ( (ValueCellFull!2061 (v!4419 V!6059)) (EmptyCell!2061) )
))
(declare-datatypes ((array!8855 0))(
  ( (array!8856 (arr!4178 (Array (_ BitVec 32) ValueCell!2061)) (size!4503 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8855)

(declare-fun mapDefault!8282 () ValueCell!2061)

(assert (=> b!199844 (= condMapEmpty!8282 (= (arr!4178 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2061)) mapDefault!8282)))))

(declare-fun b!199845 () Bool)

(declare-fun res!95074 () Bool)

(declare-fun e!131127 () Bool)

(assert (=> b!199845 (=> (not res!95074) (not e!131127))))

(declare-datatypes ((array!8857 0))(
  ( (array!8858 (arr!4179 (Array (_ BitVec 32) (_ BitVec 64))) (size!4504 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8857)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8857 (_ BitVec 32)) Bool)

(assert (=> b!199845 (= res!95074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199846 () Bool)

(assert (=> b!199846 (= e!131127 (not true))))

(declare-datatypes ((tuple2!3702 0))(
  ( (tuple2!3703 (_1!1862 (_ BitVec 64)) (_2!1862 V!6059)) )
))
(declare-datatypes ((List!2618 0))(
  ( (Nil!2615) (Cons!2614 (h!3256 tuple2!3702) (t!7549 List!2618)) )
))
(declare-datatypes ((ListLongMap!2615 0))(
  ( (ListLongMap!2616 (toList!1323 List!2618)) )
))
(declare-fun lt!98560 () ListLongMap!2615)

(declare-fun lt!98563 () array!8855)

(declare-fun zeroValue!615 () V!6059)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6059)

(declare-fun getCurrentListMap!914 (array!8857 array!8855 (_ BitVec 32) (_ BitVec 32) V!6059 V!6059 (_ BitVec 32) Int) ListLongMap!2615)

(assert (=> b!199846 (= lt!98560 (getCurrentListMap!914 _keys!825 lt!98563 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98561 () ListLongMap!2615)

(declare-fun lt!98562 () ListLongMap!2615)

(assert (=> b!199846 (and (= lt!98561 lt!98562) (= lt!98562 lt!98561))))

(declare-fun v!520 () V!6059)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!98565 () ListLongMap!2615)

(declare-fun +!350 (ListLongMap!2615 tuple2!3702) ListLongMap!2615)

(assert (=> b!199846 (= lt!98562 (+!350 lt!98565 (tuple2!3703 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6002 0))(
  ( (Unit!6003) )
))
(declare-fun lt!98564 () Unit!6002)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!27 (array!8857 array!8855 (_ BitVec 32) (_ BitVec 32) V!6059 V!6059 (_ BitVec 32) (_ BitVec 64) V!6059 (_ BitVec 32) Int) Unit!6002)

(assert (=> b!199846 (= lt!98564 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!27 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!288 (array!8857 array!8855 (_ BitVec 32) (_ BitVec 32) V!6059 V!6059 (_ BitVec 32) Int) ListLongMap!2615)

(assert (=> b!199846 (= lt!98561 (getCurrentListMapNoExtraKeys!288 _keys!825 lt!98563 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199846 (= lt!98563 (array!8856 (store (arr!4178 _values!649) i!601 (ValueCellFull!2061 v!520)) (size!4503 _values!649)))))

(assert (=> b!199846 (= lt!98565 (getCurrentListMapNoExtraKeys!288 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199847 () Bool)

(declare-fun e!131126 () Bool)

(declare-fun tp_is_empty!4809 () Bool)

(assert (=> b!199847 (= e!131126 tp_is_empty!4809)))

(declare-fun res!95071 () Bool)

(assert (=> start!20294 (=> (not res!95071) (not e!131127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20294 (= res!95071 (validMask!0 mask!1149))))

(assert (=> start!20294 e!131127))

(declare-fun array_inv!2747 (array!8855) Bool)

(assert (=> start!20294 (and (array_inv!2747 _values!649) e!131125)))

(assert (=> start!20294 true))

(assert (=> start!20294 tp_is_empty!4809))

(declare-fun array_inv!2748 (array!8857) Bool)

(assert (=> start!20294 (array_inv!2748 _keys!825)))

(assert (=> start!20294 tp!17890))

(declare-fun b!199848 () Bool)

(declare-fun res!95076 () Bool)

(assert (=> b!199848 (=> (not res!95076) (not e!131127))))

(assert (=> b!199848 (= res!95076 (and (= (size!4503 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4504 _keys!825) (size!4503 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8282 () Bool)

(assert (=> mapIsEmpty!8282 mapRes!8282))

(declare-fun b!199849 () Bool)

(declare-fun res!95073 () Bool)

(assert (=> b!199849 (=> (not res!95073) (not e!131127))))

(assert (=> b!199849 (= res!95073 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4504 _keys!825))))))

(declare-fun b!199850 () Bool)

(declare-fun res!95077 () Bool)

(assert (=> b!199850 (=> (not res!95077) (not e!131127))))

(assert (=> b!199850 (= res!95077 (= (select (arr!4179 _keys!825) i!601) k0!843))))

(declare-fun b!199851 () Bool)

(declare-fun res!95072 () Bool)

(assert (=> b!199851 (=> (not res!95072) (not e!131127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199851 (= res!95072 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8282 () Bool)

(declare-fun tp!17891 () Bool)

(assert (=> mapNonEmpty!8282 (= mapRes!8282 (and tp!17891 e!131126))))

(declare-fun mapKey!8282 () (_ BitVec 32))

(declare-fun mapValue!8282 () ValueCell!2061)

(declare-fun mapRest!8282 () (Array (_ BitVec 32) ValueCell!2061))

(assert (=> mapNonEmpty!8282 (= (arr!4178 _values!649) (store mapRest!8282 mapKey!8282 mapValue!8282))))

(declare-fun b!199852 () Bool)

(declare-fun res!95075 () Bool)

(assert (=> b!199852 (=> (not res!95075) (not e!131127))))

(declare-datatypes ((List!2619 0))(
  ( (Nil!2616) (Cons!2615 (h!3257 (_ BitVec 64)) (t!7550 List!2619)) )
))
(declare-fun arrayNoDuplicates!0 (array!8857 (_ BitVec 32) List!2619) Bool)

(assert (=> b!199852 (= res!95075 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2616))))

(declare-fun b!199853 () Bool)

(assert (=> b!199853 (= e!131128 tp_is_empty!4809)))

(assert (= (and start!20294 res!95071) b!199848))

(assert (= (and b!199848 res!95076) b!199845))

(assert (= (and b!199845 res!95074) b!199852))

(assert (= (and b!199852 res!95075) b!199849))

(assert (= (and b!199849 res!95073) b!199851))

(assert (= (and b!199851 res!95072) b!199850))

(assert (= (and b!199850 res!95077) b!199846))

(assert (= (and b!199844 condMapEmpty!8282) mapIsEmpty!8282))

(assert (= (and b!199844 (not condMapEmpty!8282)) mapNonEmpty!8282))

(get-info :version)

(assert (= (and mapNonEmpty!8282 ((_ is ValueCellFull!2061) mapValue!8282)) b!199847))

(assert (= (and b!199844 ((_ is ValueCellFull!2061) mapDefault!8282)) b!199853))

(assert (= start!20294 b!199844))

(declare-fun m!226283 () Bool)

(assert (=> b!199845 m!226283))

(declare-fun m!226285 () Bool)

(assert (=> b!199850 m!226285))

(declare-fun m!226287 () Bool)

(assert (=> b!199851 m!226287))

(declare-fun m!226289 () Bool)

(assert (=> b!199852 m!226289))

(declare-fun m!226291 () Bool)

(assert (=> start!20294 m!226291))

(declare-fun m!226293 () Bool)

(assert (=> start!20294 m!226293))

(declare-fun m!226295 () Bool)

(assert (=> start!20294 m!226295))

(declare-fun m!226297 () Bool)

(assert (=> b!199846 m!226297))

(declare-fun m!226299 () Bool)

(assert (=> b!199846 m!226299))

(declare-fun m!226301 () Bool)

(assert (=> b!199846 m!226301))

(declare-fun m!226303 () Bool)

(assert (=> b!199846 m!226303))

(declare-fun m!226305 () Bool)

(assert (=> b!199846 m!226305))

(declare-fun m!226307 () Bool)

(assert (=> b!199846 m!226307))

(declare-fun m!226309 () Bool)

(assert (=> mapNonEmpty!8282 m!226309))

(check-sat tp_is_empty!4809 (not b!199846) b_and!11699 (not b!199851) (not b!199845) (not b!199852) (not mapNonEmpty!8282) (not start!20294) (not b_next!4953))
(check-sat b_and!11699 (not b_next!4953))

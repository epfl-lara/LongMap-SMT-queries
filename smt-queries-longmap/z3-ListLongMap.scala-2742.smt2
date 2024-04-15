; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40276 () Bool)

(assert start!40276)

(declare-fun b_free!10531 () Bool)

(declare-fun b_next!10531 () Bool)

(assert (=> start!40276 (= b_free!10531 (not b_next!10531))))

(declare-fun tp!37134 () Bool)

(declare-fun b_and!18489 () Bool)

(assert (=> start!40276 (= tp!37134 b_and!18489)))

(declare-fun b!442101 () Bool)

(declare-fun res!261867 () Bool)

(declare-fun e!260197 () Bool)

(assert (=> b!442101 (=> (not res!261867) (not e!260197))))

(declare-datatypes ((array!27191 0))(
  ( (array!27192 (arr!13044 (Array (_ BitVec 32) (_ BitVec 64))) (size!13397 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27191)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16691 0))(
  ( (V!16692 (val!5889 Int)) )
))
(declare-datatypes ((ValueCell!5501 0))(
  ( (ValueCellFull!5501 (v!8134 V!16691)) (EmptyCell!5501) )
))
(declare-datatypes ((array!27193 0))(
  ( (array!27194 (arr!13045 (Array (_ BitVec 32) ValueCell!5501)) (size!13398 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27193)

(assert (=> b!442101 (= res!261867 (and (= (size!13398 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13397 _keys!709) (size!13398 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19158 () Bool)

(declare-fun mapRes!19158 () Bool)

(assert (=> mapIsEmpty!19158 mapRes!19158))

(declare-fun res!261874 () Bool)

(assert (=> start!40276 (=> (not res!261874) (not e!260197))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40276 (= res!261874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13397 _keys!709))))))

(assert (=> start!40276 e!260197))

(declare-fun tp_is_empty!11689 () Bool)

(assert (=> start!40276 tp_is_empty!11689))

(assert (=> start!40276 tp!37134))

(assert (=> start!40276 true))

(declare-fun e!260196 () Bool)

(declare-fun array_inv!9512 (array!27193) Bool)

(assert (=> start!40276 (and (array_inv!9512 _values!549) e!260196)))

(declare-fun array_inv!9513 (array!27191) Bool)

(assert (=> start!40276 (array_inv!9513 _keys!709)))

(declare-fun b!442102 () Bool)

(declare-fun res!261864 () Bool)

(assert (=> b!442102 (=> (not res!261864) (not e!260197))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442102 (= res!261864 (or (= (select (arr!13044 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13044 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442103 () Bool)

(declare-fun e!260200 () Bool)

(assert (=> b!442103 (= e!260200 tp_is_empty!11689)))

(declare-fun b!442104 () Bool)

(declare-fun res!261866 () Bool)

(declare-fun e!260198 () Bool)

(assert (=> b!442104 (=> (not res!261866) (not e!260198))))

(declare-fun lt!202952 () array!27191)

(declare-datatypes ((List!7832 0))(
  ( (Nil!7829) (Cons!7828 (h!8684 (_ BitVec 64)) (t!13581 List!7832)) )
))
(declare-fun arrayNoDuplicates!0 (array!27191 (_ BitVec 32) List!7832) Bool)

(assert (=> b!442104 (= res!261866 (arrayNoDuplicates!0 lt!202952 #b00000000000000000000000000000000 Nil!7829))))

(declare-fun b!442105 () Bool)

(declare-fun res!261870 () Bool)

(assert (=> b!442105 (=> (not res!261870) (not e!260197))))

(assert (=> b!442105 (= res!261870 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13397 _keys!709))))))

(declare-fun b!442106 () Bool)

(declare-fun res!261872 () Bool)

(assert (=> b!442106 (=> (not res!261872) (not e!260197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27191 (_ BitVec 32)) Bool)

(assert (=> b!442106 (= res!261872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442107 () Bool)

(declare-fun e!260195 () Bool)

(assert (=> b!442107 (= e!260195 tp_is_empty!11689)))

(declare-fun b!442108 () Bool)

(assert (=> b!442108 (= e!260196 (and e!260195 mapRes!19158))))

(declare-fun condMapEmpty!19158 () Bool)

(declare-fun mapDefault!19158 () ValueCell!5501)

(assert (=> b!442108 (= condMapEmpty!19158 (= (arr!13045 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5501)) mapDefault!19158)))))

(declare-fun b!442109 () Bool)

(declare-fun res!261869 () Bool)

(assert (=> b!442109 (=> (not res!261869) (not e!260197))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442109 (= res!261869 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19158 () Bool)

(declare-fun tp!37133 () Bool)

(assert (=> mapNonEmpty!19158 (= mapRes!19158 (and tp!37133 e!260200))))

(declare-fun mapKey!19158 () (_ BitVec 32))

(declare-fun mapRest!19158 () (Array (_ BitVec 32) ValueCell!5501))

(declare-fun mapValue!19158 () ValueCell!5501)

(assert (=> mapNonEmpty!19158 (= (arr!13045 _values!549) (store mapRest!19158 mapKey!19158 mapValue!19158))))

(declare-fun b!442110 () Bool)

(declare-fun res!261873 () Bool)

(assert (=> b!442110 (=> (not res!261873) (not e!260198))))

(assert (=> b!442110 (= res!261873 (bvsle from!863 i!563))))

(declare-fun b!442111 () Bool)

(assert (=> b!442111 (= e!260197 e!260198)))

(declare-fun res!261865 () Bool)

(assert (=> b!442111 (=> (not res!261865) (not e!260198))))

(assert (=> b!442111 (= res!261865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202952 mask!1025))))

(assert (=> b!442111 (= lt!202952 (array!27192 (store (arr!13044 _keys!709) i!563 k0!794) (size!13397 _keys!709)))))

(declare-fun b!442112 () Bool)

(assert (=> b!442112 (= e!260198 (and (not (= from!863 i!563)) (bvsge from!863 i!563)))))

(declare-fun minValue!515 () V!16691)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16691)

(declare-datatypes ((tuple2!7844 0))(
  ( (tuple2!7845 (_1!3933 (_ BitVec 64)) (_2!3933 V!16691)) )
))
(declare-datatypes ((List!7833 0))(
  ( (Nil!7830) (Cons!7829 (h!8685 tuple2!7844) (t!13582 List!7833)) )
))
(declare-datatypes ((ListLongMap!6747 0))(
  ( (ListLongMap!6748 (toList!3389 List!7833)) )
))
(declare-fun lt!202950 () ListLongMap!6747)

(declare-fun v!412 () V!16691)

(declare-fun getCurrentListMapNoExtraKeys!1588 (array!27191 array!27193 (_ BitVec 32) (_ BitVec 32) V!16691 V!16691 (_ BitVec 32) Int) ListLongMap!6747)

(assert (=> b!442112 (= lt!202950 (getCurrentListMapNoExtraKeys!1588 lt!202952 (array!27194 (store (arr!13045 _values!549) i!563 (ValueCellFull!5501 v!412)) (size!13398 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!202951 () ListLongMap!6747)

(assert (=> b!442112 (= lt!202951 (getCurrentListMapNoExtraKeys!1588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!442113 () Bool)

(declare-fun res!261875 () Bool)

(assert (=> b!442113 (=> (not res!261875) (not e!260197))))

(declare-fun arrayContainsKey!0 (array!27191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442113 (= res!261875 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442114 () Bool)

(declare-fun res!261868 () Bool)

(assert (=> b!442114 (=> (not res!261868) (not e!260197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442114 (= res!261868 (validMask!0 mask!1025))))

(declare-fun b!442115 () Bool)

(declare-fun res!261871 () Bool)

(assert (=> b!442115 (=> (not res!261871) (not e!260197))))

(assert (=> b!442115 (= res!261871 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7829))))

(assert (= (and start!40276 res!261874) b!442114))

(assert (= (and b!442114 res!261868) b!442101))

(assert (= (and b!442101 res!261867) b!442106))

(assert (= (and b!442106 res!261872) b!442115))

(assert (= (and b!442115 res!261871) b!442105))

(assert (= (and b!442105 res!261870) b!442109))

(assert (= (and b!442109 res!261869) b!442102))

(assert (= (and b!442102 res!261864) b!442113))

(assert (= (and b!442113 res!261875) b!442111))

(assert (= (and b!442111 res!261865) b!442104))

(assert (= (and b!442104 res!261866) b!442110))

(assert (= (and b!442110 res!261873) b!442112))

(assert (= (and b!442108 condMapEmpty!19158) mapIsEmpty!19158))

(assert (= (and b!442108 (not condMapEmpty!19158)) mapNonEmpty!19158))

(get-info :version)

(assert (= (and mapNonEmpty!19158 ((_ is ValueCellFull!5501) mapValue!19158)) b!442103))

(assert (= (and b!442108 ((_ is ValueCellFull!5501) mapDefault!19158)) b!442107))

(assert (= start!40276 b!442108))

(declare-fun m!428317 () Bool)

(assert (=> mapNonEmpty!19158 m!428317))

(declare-fun m!428319 () Bool)

(assert (=> b!442113 m!428319))

(declare-fun m!428321 () Bool)

(assert (=> b!442104 m!428321))

(declare-fun m!428323 () Bool)

(assert (=> b!442115 m!428323))

(declare-fun m!428325 () Bool)

(assert (=> b!442111 m!428325))

(declare-fun m!428327 () Bool)

(assert (=> b!442111 m!428327))

(declare-fun m!428329 () Bool)

(assert (=> b!442114 m!428329))

(declare-fun m!428331 () Bool)

(assert (=> b!442102 m!428331))

(declare-fun m!428333 () Bool)

(assert (=> b!442109 m!428333))

(declare-fun m!428335 () Bool)

(assert (=> b!442112 m!428335))

(declare-fun m!428337 () Bool)

(assert (=> b!442112 m!428337))

(declare-fun m!428339 () Bool)

(assert (=> b!442112 m!428339))

(declare-fun m!428341 () Bool)

(assert (=> start!40276 m!428341))

(declare-fun m!428343 () Bool)

(assert (=> start!40276 m!428343))

(declare-fun m!428345 () Bool)

(assert (=> b!442106 m!428345))

(check-sat (not b!442115) (not b!442113) (not mapNonEmpty!19158) (not b!442106) (not b!442104) tp_is_empty!11689 (not b!442114) (not b!442111) (not b!442109) (not b_next!10531) (not b!442112) (not start!40276) b_and!18489)
(check-sat b_and!18489 (not b_next!10531))

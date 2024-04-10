; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35386 () Bool)

(assert start!35386)

(declare-fun b!354260 () Bool)

(declare-fun e!217089 () Bool)

(declare-fun tp_is_empty!7839 () Bool)

(assert (=> b!354260 (= e!217089 tp_is_empty!7839)))

(declare-fun b!354261 () Bool)

(declare-fun e!217091 () Bool)

(assert (=> b!354261 (= e!217091 tp_is_empty!7839)))

(declare-fun b!354262 () Bool)

(declare-fun res!196389 () Bool)

(declare-fun e!217087 () Bool)

(assert (=> b!354262 (=> (not res!196389) (not e!217087))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19265 0))(
  ( (array!19266 (arr!9126 (Array (_ BitVec 32) (_ BitVec 64))) (size!9478 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19265)

(declare-datatypes ((V!11429 0))(
  ( (V!11430 (val!3964 Int)) )
))
(declare-datatypes ((ValueCell!3576 0))(
  ( (ValueCellFull!3576 (v!6158 V!11429)) (EmptyCell!3576) )
))
(declare-datatypes ((array!19267 0))(
  ( (array!19268 (arr!9127 (Array (_ BitVec 32) ValueCell!3576)) (size!9479 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19267)

(assert (=> b!354262 (= res!196389 (and (= (size!9479 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9478 _keys!1456) (size!9479 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13266 () Bool)

(declare-fun mapRes!13266 () Bool)

(declare-fun tp!27162 () Bool)

(assert (=> mapNonEmpty!13266 (= mapRes!13266 (and tp!27162 e!217089))))

(declare-fun mapKey!13266 () (_ BitVec 32))

(declare-fun mapValue!13266 () ValueCell!3576)

(declare-fun mapRest!13266 () (Array (_ BitVec 32) ValueCell!3576))

(assert (=> mapNonEmpty!13266 (= (arr!9127 _values!1208) (store mapRest!13266 mapKey!13266 mapValue!13266))))

(declare-fun b!354263 () Bool)

(assert (=> b!354263 (= e!217087 false)))

(declare-fun lt!165674 () Bool)

(declare-datatypes ((List!5291 0))(
  ( (Nil!5288) (Cons!5287 (h!6143 (_ BitVec 64)) (t!10441 List!5291)) )
))
(declare-fun arrayNoDuplicates!0 (array!19265 (_ BitVec 32) List!5291) Bool)

(assert (=> b!354263 (= lt!165674 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5288))))

(declare-fun mapIsEmpty!13266 () Bool)

(assert (=> mapIsEmpty!13266 mapRes!13266))

(declare-fun res!196388 () Bool)

(assert (=> start!35386 (=> (not res!196388) (not e!217087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35386 (= res!196388 (validMask!0 mask!1842))))

(assert (=> start!35386 e!217087))

(assert (=> start!35386 true))

(declare-fun e!217088 () Bool)

(declare-fun array_inv!6712 (array!19267) Bool)

(assert (=> start!35386 (and (array_inv!6712 _values!1208) e!217088)))

(declare-fun array_inv!6713 (array!19265) Bool)

(assert (=> start!35386 (array_inv!6713 _keys!1456)))

(declare-fun b!354264 () Bool)

(assert (=> b!354264 (= e!217088 (and e!217091 mapRes!13266))))

(declare-fun condMapEmpty!13266 () Bool)

(declare-fun mapDefault!13266 () ValueCell!3576)

(assert (=> b!354264 (= condMapEmpty!13266 (= (arr!9127 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3576)) mapDefault!13266)))))

(declare-fun b!354265 () Bool)

(declare-fun res!196390 () Bool)

(assert (=> b!354265 (=> (not res!196390) (not e!217087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19265 (_ BitVec 32)) Bool)

(assert (=> b!354265 (= res!196390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35386 res!196388) b!354262))

(assert (= (and b!354262 res!196389) b!354265))

(assert (= (and b!354265 res!196390) b!354263))

(assert (= (and b!354264 condMapEmpty!13266) mapIsEmpty!13266))

(assert (= (and b!354264 (not condMapEmpty!13266)) mapNonEmpty!13266))

(get-info :version)

(assert (= (and mapNonEmpty!13266 ((_ is ValueCellFull!3576) mapValue!13266)) b!354260))

(assert (= (and b!354264 ((_ is ValueCellFull!3576) mapDefault!13266)) b!354261))

(assert (= start!35386 b!354264))

(declare-fun m!353335 () Bool)

(assert (=> mapNonEmpty!13266 m!353335))

(declare-fun m!353337 () Bool)

(assert (=> b!354263 m!353337))

(declare-fun m!353339 () Bool)

(assert (=> start!35386 m!353339))

(declare-fun m!353341 () Bool)

(assert (=> start!35386 m!353341))

(declare-fun m!353343 () Bool)

(assert (=> start!35386 m!353343))

(declare-fun m!353345 () Bool)

(assert (=> b!354265 m!353345))

(check-sat (not start!35386) tp_is_empty!7839 (not mapNonEmpty!13266) (not b!354263) (not b!354265))
(check-sat)
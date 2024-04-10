; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38472 () Bool)

(assert start!38472)

(declare-fun b!397101 () Bool)

(declare-fun e!240201 () Bool)

(declare-fun tp_is_empty!9891 () Bool)

(assert (=> b!397101 (= e!240201 tp_is_empty!9891)))

(declare-fun b!397102 () Bool)

(declare-fun res!227949 () Bool)

(declare-fun e!240202 () Bool)

(assert (=> b!397102 (=> (not res!227949) (not e!240202))))

(declare-datatypes ((array!23695 0))(
  ( (array!23696 (arr!11297 (Array (_ BitVec 32) (_ BitVec 64))) (size!11649 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23695)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397102 (= res!227949 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397103 () Bool)

(declare-fun res!227940 () Bool)

(assert (=> b!397103 (=> (not res!227940) (not e!240202))))

(declare-datatypes ((List!6541 0))(
  ( (Nil!6538) (Cons!6537 (h!7393 (_ BitVec 64)) (t!11715 List!6541)) )
))
(declare-fun arrayNoDuplicates!0 (array!23695 (_ BitVec 32) List!6541) Bool)

(assert (=> b!397103 (= res!227940 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6538))))

(declare-fun mapIsEmpty!16458 () Bool)

(declare-fun mapRes!16458 () Bool)

(assert (=> mapIsEmpty!16458 mapRes!16458))

(declare-fun b!397104 () Bool)

(declare-fun res!227948 () Bool)

(assert (=> b!397104 (=> (not res!227948) (not e!240202))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14293 0))(
  ( (V!14294 (val!4990 Int)) )
))
(declare-datatypes ((ValueCell!4602 0))(
  ( (ValueCellFull!4602 (v!7237 V!14293)) (EmptyCell!4602) )
))
(declare-datatypes ((array!23697 0))(
  ( (array!23698 (arr!11298 (Array (_ BitVec 32) ValueCell!4602)) (size!11650 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23697)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397104 (= res!227948 (and (= (size!11650 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11649 _keys!709) (size!11650 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397105 () Bool)

(declare-fun e!240204 () Bool)

(assert (=> b!397105 (= e!240202 e!240204)))

(declare-fun res!227942 () Bool)

(assert (=> b!397105 (=> (not res!227942) (not e!240204))))

(declare-fun lt!187253 () array!23695)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23695 (_ BitVec 32)) Bool)

(assert (=> b!397105 (= res!227942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187253 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397105 (= lt!187253 (array!23696 (store (arr!11297 _keys!709) i!563 k0!794) (size!11649 _keys!709)))))

(declare-fun b!397106 () Bool)

(declare-fun res!227941 () Bool)

(assert (=> b!397106 (=> (not res!227941) (not e!240202))))

(assert (=> b!397106 (= res!227941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397107 () Bool)

(declare-fun e!240199 () Bool)

(assert (=> b!397107 (= e!240199 tp_is_empty!9891)))

(declare-fun b!397108 () Bool)

(assert (=> b!397108 (= e!240204 false)))

(declare-fun lt!187252 () Bool)

(assert (=> b!397108 (= lt!187252 (arrayNoDuplicates!0 lt!187253 #b00000000000000000000000000000000 Nil!6538))))

(declare-fun b!397100 () Bool)

(declare-fun res!227947 () Bool)

(assert (=> b!397100 (=> (not res!227947) (not e!240202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397100 (= res!227947 (validMask!0 mask!1025))))

(declare-fun res!227944 () Bool)

(assert (=> start!38472 (=> (not res!227944) (not e!240202))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38472 (= res!227944 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11649 _keys!709))))))

(assert (=> start!38472 e!240202))

(assert (=> start!38472 true))

(declare-fun e!240200 () Bool)

(declare-fun array_inv!8282 (array!23697) Bool)

(assert (=> start!38472 (and (array_inv!8282 _values!549) e!240200)))

(declare-fun array_inv!8283 (array!23695) Bool)

(assert (=> start!38472 (array_inv!8283 _keys!709)))

(declare-fun b!397109 () Bool)

(declare-fun res!227946 () Bool)

(assert (=> b!397109 (=> (not res!227946) (not e!240202))))

(assert (=> b!397109 (= res!227946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11649 _keys!709))))))

(declare-fun b!397110 () Bool)

(assert (=> b!397110 (= e!240200 (and e!240201 mapRes!16458))))

(declare-fun condMapEmpty!16458 () Bool)

(declare-fun mapDefault!16458 () ValueCell!4602)

(assert (=> b!397110 (= condMapEmpty!16458 (= (arr!11298 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4602)) mapDefault!16458)))))

(declare-fun b!397111 () Bool)

(declare-fun res!227943 () Bool)

(assert (=> b!397111 (=> (not res!227943) (not e!240202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397111 (= res!227943 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16458 () Bool)

(declare-fun tp!32253 () Bool)

(assert (=> mapNonEmpty!16458 (= mapRes!16458 (and tp!32253 e!240199))))

(declare-fun mapRest!16458 () (Array (_ BitVec 32) ValueCell!4602))

(declare-fun mapKey!16458 () (_ BitVec 32))

(declare-fun mapValue!16458 () ValueCell!4602)

(assert (=> mapNonEmpty!16458 (= (arr!11298 _values!549) (store mapRest!16458 mapKey!16458 mapValue!16458))))

(declare-fun b!397112 () Bool)

(declare-fun res!227945 () Bool)

(assert (=> b!397112 (=> (not res!227945) (not e!240202))))

(assert (=> b!397112 (= res!227945 (or (= (select (arr!11297 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11297 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38472 res!227944) b!397100))

(assert (= (and b!397100 res!227947) b!397104))

(assert (= (and b!397104 res!227948) b!397106))

(assert (= (and b!397106 res!227941) b!397103))

(assert (= (and b!397103 res!227940) b!397109))

(assert (= (and b!397109 res!227946) b!397111))

(assert (= (and b!397111 res!227943) b!397112))

(assert (= (and b!397112 res!227945) b!397102))

(assert (= (and b!397102 res!227949) b!397105))

(assert (= (and b!397105 res!227942) b!397108))

(assert (= (and b!397110 condMapEmpty!16458) mapIsEmpty!16458))

(assert (= (and b!397110 (not condMapEmpty!16458)) mapNonEmpty!16458))

(get-info :version)

(assert (= (and mapNonEmpty!16458 ((_ is ValueCellFull!4602) mapValue!16458)) b!397107))

(assert (= (and b!397110 ((_ is ValueCellFull!4602) mapDefault!16458)) b!397101))

(assert (= start!38472 b!397110))

(declare-fun m!392479 () Bool)

(assert (=> b!397108 m!392479))

(declare-fun m!392481 () Bool)

(assert (=> b!397112 m!392481))

(declare-fun m!392483 () Bool)

(assert (=> b!397106 m!392483))

(declare-fun m!392485 () Bool)

(assert (=> b!397105 m!392485))

(declare-fun m!392487 () Bool)

(assert (=> b!397105 m!392487))

(declare-fun m!392489 () Bool)

(assert (=> start!38472 m!392489))

(declare-fun m!392491 () Bool)

(assert (=> start!38472 m!392491))

(declare-fun m!392493 () Bool)

(assert (=> b!397111 m!392493))

(declare-fun m!392495 () Bool)

(assert (=> b!397100 m!392495))

(declare-fun m!392497 () Bool)

(assert (=> b!397102 m!392497))

(declare-fun m!392499 () Bool)

(assert (=> b!397103 m!392499))

(declare-fun m!392501 () Bool)

(assert (=> mapNonEmpty!16458 m!392501))

(check-sat (not mapNonEmpty!16458) (not b!397106) (not b!397111) (not b!397102) (not b!397108) (not b!397103) tp_is_empty!9891 (not start!38472) (not b!397105) (not b!397100))
(check-sat)

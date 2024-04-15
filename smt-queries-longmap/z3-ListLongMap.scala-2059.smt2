; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35508 () Bool)

(assert start!35508)

(declare-fun res!197358 () Bool)

(declare-fun e!217933 () Bool)

(assert (=> start!35508 (=> (not res!197358) (not e!217933))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35508 (= res!197358 (validMask!0 mask!1842))))

(assert (=> start!35508 e!217933))

(assert (=> start!35508 true))

(declare-datatypes ((V!11611 0))(
  ( (V!11612 (val!4032 Int)) )
))
(declare-datatypes ((ValueCell!3644 0))(
  ( (ValueCellFull!3644 (v!6220 V!11611)) (EmptyCell!3644) )
))
(declare-datatypes ((array!19511 0))(
  ( (array!19512 (arr!9249 (Array (_ BitVec 32) ValueCell!3644)) (size!9602 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19511)

(declare-fun e!217935 () Bool)

(declare-fun array_inv!6840 (array!19511) Bool)

(assert (=> start!35508 (and (array_inv!6840 _values!1208) e!217935)))

(declare-datatypes ((array!19513 0))(
  ( (array!19514 (arr!9250 (Array (_ BitVec 32) (_ BitVec 64))) (size!9603 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19513)

(declare-fun array_inv!6841 (array!19513) Bool)

(assert (=> start!35508 (array_inv!6841 _keys!1456)))

(declare-fun b!355695 () Bool)

(declare-fun res!197357 () Bool)

(assert (=> b!355695 (=> (not res!197357) (not e!217933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19513 (_ BitVec 32)) Bool)

(assert (=> b!355695 (= res!197357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355696 () Bool)

(declare-fun e!217931 () Bool)

(declare-fun tp_is_empty!7975 () Bool)

(assert (=> b!355696 (= e!217931 tp_is_empty!7975)))

(declare-fun b!355697 () Bool)

(declare-fun mapRes!13470 () Bool)

(assert (=> b!355697 (= e!217935 (and e!217931 mapRes!13470))))

(declare-fun condMapEmpty!13470 () Bool)

(declare-fun mapDefault!13470 () ValueCell!3644)

(assert (=> b!355697 (= condMapEmpty!13470 (= (arr!9249 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3644)) mapDefault!13470)))))

(declare-fun b!355698 () Bool)

(declare-fun res!197359 () Bool)

(assert (=> b!355698 (=> (not res!197359) (not e!217933))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355698 (= res!197359 (and (= (size!9602 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9603 _keys!1456) (size!9602 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355699 () Bool)

(declare-fun e!217932 () Bool)

(assert (=> b!355699 (= e!217932 tp_is_empty!7975)))

(declare-fun b!355700 () Bool)

(assert (=> b!355700 (= e!217933 false)))

(declare-fun lt!165643 () Bool)

(declare-datatypes ((List!5327 0))(
  ( (Nil!5324) (Cons!5323 (h!6179 (_ BitVec 64)) (t!10468 List!5327)) )
))
(declare-fun arrayNoDuplicates!0 (array!19513 (_ BitVec 32) List!5327) Bool)

(assert (=> b!355700 (= lt!165643 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5324))))

(declare-fun mapIsEmpty!13470 () Bool)

(assert (=> mapIsEmpty!13470 mapRes!13470))

(declare-fun mapNonEmpty!13470 () Bool)

(declare-fun tp!27447 () Bool)

(assert (=> mapNonEmpty!13470 (= mapRes!13470 (and tp!27447 e!217932))))

(declare-fun mapKey!13470 () (_ BitVec 32))

(declare-fun mapRest!13470 () (Array (_ BitVec 32) ValueCell!3644))

(declare-fun mapValue!13470 () ValueCell!3644)

(assert (=> mapNonEmpty!13470 (= (arr!9249 _values!1208) (store mapRest!13470 mapKey!13470 mapValue!13470))))

(assert (= (and start!35508 res!197358) b!355698))

(assert (= (and b!355698 res!197359) b!355695))

(assert (= (and b!355695 res!197357) b!355700))

(assert (= (and b!355697 condMapEmpty!13470) mapIsEmpty!13470))

(assert (= (and b!355697 (not condMapEmpty!13470)) mapNonEmpty!13470))

(get-info :version)

(assert (= (and mapNonEmpty!13470 ((_ is ValueCellFull!3644) mapValue!13470)) b!355699))

(assert (= (and b!355697 ((_ is ValueCellFull!3644) mapDefault!13470)) b!355696))

(assert (= start!35508 b!355697))

(declare-fun m!353799 () Bool)

(assert (=> start!35508 m!353799))

(declare-fun m!353801 () Bool)

(assert (=> start!35508 m!353801))

(declare-fun m!353803 () Bool)

(assert (=> start!35508 m!353803))

(declare-fun m!353805 () Bool)

(assert (=> b!355695 m!353805))

(declare-fun m!353807 () Bool)

(assert (=> b!355700 m!353807))

(declare-fun m!353809 () Bool)

(assert (=> mapNonEmpty!13470 m!353809))

(check-sat (not mapNonEmpty!13470) (not b!355700) tp_is_empty!7975 (not b!355695) (not start!35508))
(check-sat)

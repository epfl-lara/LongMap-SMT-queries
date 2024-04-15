; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35358 () Bool)

(assert start!35358)

(declare-fun b!353859 () Bool)

(declare-fun res!196198 () Bool)

(declare-fun e!216807 () Bool)

(assert (=> b!353859 (=> (not res!196198) (not e!216807))))

(declare-datatypes ((array!19221 0))(
  ( (array!19222 (arr!9104 (Array (_ BitVec 32) (_ BitVec 64))) (size!9457 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19221)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19221 (_ BitVec 32)) Bool)

(assert (=> b!353859 (= res!196198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196196 () Bool)

(assert (=> start!35358 (=> (not res!196196) (not e!216807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35358 (= res!196196 (validMask!0 mask!1842))))

(assert (=> start!35358 e!216807))

(assert (=> start!35358 true))

(declare-datatypes ((V!11411 0))(
  ( (V!11412 (val!3957 Int)) )
))
(declare-datatypes ((ValueCell!3569 0))(
  ( (ValueCellFull!3569 (v!6145 V!11411)) (EmptyCell!3569) )
))
(declare-datatypes ((array!19223 0))(
  ( (array!19224 (arr!9105 (Array (_ BitVec 32) ValueCell!3569)) (size!9458 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19223)

(declare-fun e!216808 () Bool)

(declare-fun array_inv!6740 (array!19223) Bool)

(assert (=> start!35358 (and (array_inv!6740 _values!1208) e!216808)))

(declare-fun array_inv!6741 (array!19221) Bool)

(assert (=> start!35358 (array_inv!6741 _keys!1456)))

(declare-fun b!353860 () Bool)

(declare-fun e!216810 () Bool)

(declare-fun mapRes!13245 () Bool)

(assert (=> b!353860 (= e!216808 (and e!216810 mapRes!13245))))

(declare-fun condMapEmpty!13245 () Bool)

(declare-fun mapDefault!13245 () ValueCell!3569)

(assert (=> b!353860 (= condMapEmpty!13245 (= (arr!9105 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3569)) mapDefault!13245)))))

(declare-fun b!353861 () Bool)

(declare-fun tp_is_empty!7825 () Bool)

(assert (=> b!353861 (= e!216810 tp_is_empty!7825)))

(declare-fun b!353862 () Bool)

(declare-fun res!196197 () Bool)

(assert (=> b!353862 (=> (not res!196197) (not e!216807))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353862 (= res!196197 (and (= (size!9458 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9457 _keys!1456) (size!9458 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13245 () Bool)

(assert (=> mapIsEmpty!13245 mapRes!13245))

(declare-fun b!353863 () Bool)

(declare-fun e!216809 () Bool)

(assert (=> b!353863 (= e!216809 tp_is_empty!7825)))

(declare-fun mapNonEmpty!13245 () Bool)

(declare-fun tp!27141 () Bool)

(assert (=> mapNonEmpty!13245 (= mapRes!13245 (and tp!27141 e!216809))))

(declare-fun mapRest!13245 () (Array (_ BitVec 32) ValueCell!3569))

(declare-fun mapValue!13245 () ValueCell!3569)

(declare-fun mapKey!13245 () (_ BitVec 32))

(assert (=> mapNonEmpty!13245 (= (arr!9105 _values!1208) (store mapRest!13245 mapKey!13245 mapValue!13245))))

(declare-fun b!353864 () Bool)

(assert (=> b!353864 (= e!216807 false)))

(declare-fun lt!165418 () Bool)

(declare-datatypes ((List!5259 0))(
  ( (Nil!5256) (Cons!5255 (h!6111 (_ BitVec 64)) (t!10400 List!5259)) )
))
(declare-fun arrayNoDuplicates!0 (array!19221 (_ BitVec 32) List!5259) Bool)

(assert (=> b!353864 (= lt!165418 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5256))))

(assert (= (and start!35358 res!196196) b!353862))

(assert (= (and b!353862 res!196197) b!353859))

(assert (= (and b!353859 res!196198) b!353864))

(assert (= (and b!353860 condMapEmpty!13245) mapIsEmpty!13245))

(assert (= (and b!353860 (not condMapEmpty!13245)) mapNonEmpty!13245))

(get-info :version)

(assert (= (and mapNonEmpty!13245 ((_ is ValueCellFull!3569) mapValue!13245)) b!353863))

(assert (= (and b!353860 ((_ is ValueCellFull!3569) mapDefault!13245)) b!353861))

(assert (= start!35358 b!353860))

(declare-fun m!352521 () Bool)

(assert (=> b!353859 m!352521))

(declare-fun m!352523 () Bool)

(assert (=> start!35358 m!352523))

(declare-fun m!352525 () Bool)

(assert (=> start!35358 m!352525))

(declare-fun m!352527 () Bool)

(assert (=> start!35358 m!352527))

(declare-fun m!352529 () Bool)

(assert (=> mapNonEmpty!13245 m!352529))

(declare-fun m!352531 () Bool)

(assert (=> b!353864 m!352531))

(check-sat (not b!353864) (not mapNonEmpty!13245) tp_is_empty!7825 (not b!353859) (not start!35358))
(check-sat)

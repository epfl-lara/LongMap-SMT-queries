; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35530 () Bool)

(assert start!35530)

(declare-fun b!356042 () Bool)

(declare-fun e!218170 () Bool)

(assert (=> b!356042 (= e!218170 false)))

(declare-fun lt!165890 () Bool)

(declare-datatypes ((array!19539 0))(
  ( (array!19540 (arr!9263 (Array (_ BitVec 32) (_ BitVec 64))) (size!9615 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19539)

(declare-datatypes ((List!5358 0))(
  ( (Nil!5355) (Cons!5354 (h!6210 (_ BitVec 64)) (t!10508 List!5358)) )
))
(declare-fun arrayNoDuplicates!0 (array!19539 (_ BitVec 32) List!5358) Bool)

(assert (=> b!356042 (= lt!165890 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5355))))

(declare-fun b!356043 () Bool)

(declare-fun res!197523 () Bool)

(assert (=> b!356043 (=> (not res!197523) (not e!218170))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11621 0))(
  ( (V!11622 (val!4036 Int)) )
))
(declare-datatypes ((ValueCell!3648 0))(
  ( (ValueCellFull!3648 (v!6230 V!11621)) (EmptyCell!3648) )
))
(declare-datatypes ((array!19541 0))(
  ( (array!19542 (arr!9264 (Array (_ BitVec 32) ValueCell!3648)) (size!9616 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19541)

(assert (=> b!356043 (= res!197523 (and (= (size!9616 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9615 _keys!1456) (size!9616 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356044 () Bool)

(declare-fun e!218167 () Bool)

(declare-fun e!218168 () Bool)

(declare-fun mapRes!13482 () Bool)

(assert (=> b!356044 (= e!218167 (and e!218168 mapRes!13482))))

(declare-fun condMapEmpty!13482 () Bool)

(declare-fun mapDefault!13482 () ValueCell!3648)

(assert (=> b!356044 (= condMapEmpty!13482 (= (arr!9264 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3648)) mapDefault!13482)))))

(declare-fun b!356045 () Bool)

(declare-fun e!218169 () Bool)

(declare-fun tp_is_empty!7983 () Bool)

(assert (=> b!356045 (= e!218169 tp_is_empty!7983)))

(declare-fun res!197524 () Bool)

(assert (=> start!35530 (=> (not res!197524) (not e!218170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35530 (= res!197524 (validMask!0 mask!1842))))

(assert (=> start!35530 e!218170))

(assert (=> start!35530 true))

(declare-fun array_inv!6806 (array!19541) Bool)

(assert (=> start!35530 (and (array_inv!6806 _values!1208) e!218167)))

(declare-fun array_inv!6807 (array!19539) Bool)

(assert (=> start!35530 (array_inv!6807 _keys!1456)))

(declare-fun b!356046 () Bool)

(assert (=> b!356046 (= e!218168 tp_is_empty!7983)))

(declare-fun mapNonEmpty!13482 () Bool)

(declare-fun tp!27459 () Bool)

(assert (=> mapNonEmpty!13482 (= mapRes!13482 (and tp!27459 e!218169))))

(declare-fun mapRest!13482 () (Array (_ BitVec 32) ValueCell!3648))

(declare-fun mapKey!13482 () (_ BitVec 32))

(declare-fun mapValue!13482 () ValueCell!3648)

(assert (=> mapNonEmpty!13482 (= (arr!9264 _values!1208) (store mapRest!13482 mapKey!13482 mapValue!13482))))

(declare-fun b!356047 () Bool)

(declare-fun res!197522 () Bool)

(assert (=> b!356047 (=> (not res!197522) (not e!218170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19539 (_ BitVec 32)) Bool)

(assert (=> b!356047 (= res!197522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13482 () Bool)

(assert (=> mapIsEmpty!13482 mapRes!13482))

(assert (= (and start!35530 res!197524) b!356043))

(assert (= (and b!356043 res!197523) b!356047))

(assert (= (and b!356047 res!197522) b!356042))

(assert (= (and b!356044 condMapEmpty!13482) mapIsEmpty!13482))

(assert (= (and b!356044 (not condMapEmpty!13482)) mapNonEmpty!13482))

(get-info :version)

(assert (= (and mapNonEmpty!13482 ((_ is ValueCellFull!3648) mapValue!13482)) b!356045))

(assert (= (and b!356044 ((_ is ValueCellFull!3648) mapDefault!13482)) b!356046))

(assert (= start!35530 b!356044))

(declare-fun m!354577 () Bool)

(assert (=> b!356042 m!354577))

(declare-fun m!354579 () Bool)

(assert (=> start!35530 m!354579))

(declare-fun m!354581 () Bool)

(assert (=> start!35530 m!354581))

(declare-fun m!354583 () Bool)

(assert (=> start!35530 m!354583))

(declare-fun m!354585 () Bool)

(assert (=> mapNonEmpty!13482 m!354585))

(declare-fun m!354587 () Bool)

(assert (=> b!356047 m!354587))

(check-sat (not b!356047) (not b!356042) (not start!35530) (not mapNonEmpty!13482) tp_is_empty!7983)
(check-sat)

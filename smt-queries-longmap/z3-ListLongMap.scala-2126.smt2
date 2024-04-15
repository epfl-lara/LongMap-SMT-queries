; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35970 () Bool)

(assert start!35970)

(declare-fun b!361174 () Bool)

(declare-fun e!221170 () Bool)

(declare-fun tp_is_empty!8377 () Bool)

(assert (=> b!361174 (= e!221170 tp_is_empty!8377)))

(declare-fun mapIsEmpty!14091 () Bool)

(declare-fun mapRes!14091 () Bool)

(assert (=> mapIsEmpty!14091 mapRes!14091))

(declare-fun b!361175 () Bool)

(declare-fun res!200944 () Bool)

(declare-fun e!221167 () Bool)

(assert (=> b!361175 (=> (not res!200944) (not e!221167))))

(declare-datatypes ((array!20287 0))(
  ( (array!20288 (arr!9631 (Array (_ BitVec 32) (_ BitVec 64))) (size!9984 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20287)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20287 (_ BitVec 32)) Bool)

(assert (=> b!361175 (= res!200944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapNonEmpty!14091 () Bool)

(declare-fun tp!28167 () Bool)

(assert (=> mapNonEmpty!14091 (= mapRes!14091 (and tp!28167 e!221170))))

(declare-datatypes ((V!12147 0))(
  ( (V!12148 (val!4233 Int)) )
))
(declare-datatypes ((ValueCell!3845 0))(
  ( (ValueCellFull!3845 (v!6422 V!12147)) (EmptyCell!3845) )
))
(declare-fun mapRest!14091 () (Array (_ BitVec 32) ValueCell!3845))

(declare-fun mapKey!14091 () (_ BitVec 32))

(declare-datatypes ((array!20289 0))(
  ( (array!20290 (arr!9632 (Array (_ BitVec 32) ValueCell!3845)) (size!9985 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20289)

(declare-fun mapValue!14091 () ValueCell!3845)

(assert (=> mapNonEmpty!14091 (= (arr!9632 _values!1277) (store mapRest!14091 mapKey!14091 mapValue!14091))))

(declare-fun res!200945 () Bool)

(assert (=> start!35970 (=> (not res!200945) (not e!221167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35970 (= res!200945 (validMask!0 mask!1943))))

(assert (=> start!35970 e!221167))

(assert (=> start!35970 true))

(declare-fun e!221166 () Bool)

(declare-fun array_inv!7096 (array!20289) Bool)

(assert (=> start!35970 (and (array_inv!7096 _values!1277) e!221166)))

(declare-fun array_inv!7097 (array!20287) Bool)

(assert (=> start!35970 (array_inv!7097 _keys!1541)))

(declare-fun b!361176 () Bool)

(assert (=> b!361176 (= e!221167 false)))

(declare-fun lt!166325 () Bool)

(declare-datatypes ((List!5472 0))(
  ( (Nil!5469) (Cons!5468 (h!6324 (_ BitVec 64)) (t!10613 List!5472)) )
))
(declare-fun arrayNoDuplicates!0 (array!20287 (_ BitVec 32) List!5472) Bool)

(assert (=> b!361176 (= lt!166325 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5469))))

(declare-fun b!361177 () Bool)

(declare-fun e!221169 () Bool)

(assert (=> b!361177 (= e!221166 (and e!221169 mapRes!14091))))

(declare-fun condMapEmpty!14091 () Bool)

(declare-fun mapDefault!14091 () ValueCell!3845)

(assert (=> b!361177 (= condMapEmpty!14091 (= (arr!9632 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3845)) mapDefault!14091)))))

(declare-fun b!361178 () Bool)

(declare-fun res!200943 () Bool)

(assert (=> b!361178 (=> (not res!200943) (not e!221167))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361178 (= res!200943 (and (= (size!9985 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9984 _keys!1541) (size!9985 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361179 () Bool)

(assert (=> b!361179 (= e!221169 tp_is_empty!8377)))

(assert (= (and start!35970 res!200945) b!361178))

(assert (= (and b!361178 res!200943) b!361175))

(assert (= (and b!361175 res!200944) b!361176))

(assert (= (and b!361177 condMapEmpty!14091) mapIsEmpty!14091))

(assert (= (and b!361177 (not condMapEmpty!14091)) mapNonEmpty!14091))

(get-info :version)

(assert (= (and mapNonEmpty!14091 ((_ is ValueCellFull!3845) mapValue!14091)) b!361174))

(assert (= (and b!361177 ((_ is ValueCellFull!3845) mapDefault!14091)) b!361179))

(assert (= start!35970 b!361177))

(declare-fun m!357543 () Bool)

(assert (=> b!361175 m!357543))

(declare-fun m!357545 () Bool)

(assert (=> mapNonEmpty!14091 m!357545))

(declare-fun m!357547 () Bool)

(assert (=> start!35970 m!357547))

(declare-fun m!357549 () Bool)

(assert (=> start!35970 m!357549))

(declare-fun m!357551 () Bool)

(assert (=> start!35970 m!357551))

(declare-fun m!357553 () Bool)

(assert (=> b!361176 m!357553))

(check-sat (not mapNonEmpty!14091) (not start!35970) (not b!361175) tp_is_empty!8377 (not b!361176))
(check-sat)

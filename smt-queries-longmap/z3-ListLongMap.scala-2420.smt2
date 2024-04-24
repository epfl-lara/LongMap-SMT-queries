; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38234 () Bool)

(assert start!38234)

(declare-fun b!394602 () Bool)

(declare-fun e!238869 () Bool)

(declare-fun tp_is_empty!9757 () Bool)

(assert (=> b!394602 (= e!238869 tp_is_empty!9757)))

(declare-fun mapIsEmpty!16236 () Bool)

(declare-fun mapRes!16236 () Bool)

(assert (=> mapIsEmpty!16236 mapRes!16236))

(declare-fun res!226219 () Bool)

(declare-fun e!238868 () Bool)

(assert (=> start!38234 (=> (not res!226219) (not e!238868))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23410 0))(
  ( (array!23411 (arr!11161 (Array (_ BitVec 32) (_ BitVec 64))) (size!11513 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23410)

(assert (=> start!38234 (= res!226219 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11513 _keys!709))))))

(assert (=> start!38234 e!238868))

(assert (=> start!38234 true))

(declare-datatypes ((V!14115 0))(
  ( (V!14116 (val!4923 Int)) )
))
(declare-datatypes ((ValueCell!4535 0))(
  ( (ValueCellFull!4535 (v!7169 V!14115)) (EmptyCell!4535) )
))
(declare-datatypes ((array!23412 0))(
  ( (array!23413 (arr!11162 (Array (_ BitVec 32) ValueCell!4535)) (size!11514 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23412)

(declare-fun e!238865 () Bool)

(declare-fun array_inv!8252 (array!23412) Bool)

(assert (=> start!38234 (and (array_inv!8252 _values!549) e!238865)))

(declare-fun array_inv!8253 (array!23410) Bool)

(assert (=> start!38234 (array_inv!8253 _keys!709)))

(declare-fun mapNonEmpty!16236 () Bool)

(declare-fun tp!32031 () Bool)

(declare-fun e!238867 () Bool)

(assert (=> mapNonEmpty!16236 (= mapRes!16236 (and tp!32031 e!238867))))

(declare-fun mapKey!16236 () (_ BitVec 32))

(declare-fun mapValue!16236 () ValueCell!4535)

(declare-fun mapRest!16236 () (Array (_ BitVec 32) ValueCell!4535))

(assert (=> mapNonEmpty!16236 (= (arr!11162 _values!549) (store mapRest!16236 mapKey!16236 mapValue!16236))))

(declare-fun b!394603 () Bool)

(declare-fun res!226220 () Bool)

(assert (=> b!394603 (=> (not res!226220) (not e!238868))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394603 (= res!226220 (validMask!0 mask!1025))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394604 () Bool)

(assert (=> b!394604 (= e!238868 (and (= (size!11514 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11513 _keys!709) (size!11514 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (= (size!11513 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11513 _keys!709))))))

(declare-fun b!394605 () Bool)

(assert (=> b!394605 (= e!238865 (and e!238869 mapRes!16236))))

(declare-fun condMapEmpty!16236 () Bool)

(declare-fun mapDefault!16236 () ValueCell!4535)

(assert (=> b!394605 (= condMapEmpty!16236 (= (arr!11162 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4535)) mapDefault!16236)))))

(declare-fun b!394606 () Bool)

(assert (=> b!394606 (= e!238867 tp_is_empty!9757)))

(assert (= (and start!38234 res!226219) b!394603))

(assert (= (and b!394603 res!226220) b!394604))

(assert (= (and b!394605 condMapEmpty!16236) mapIsEmpty!16236))

(assert (= (and b!394605 (not condMapEmpty!16236)) mapNonEmpty!16236))

(get-info :version)

(assert (= (and mapNonEmpty!16236 ((_ is ValueCellFull!4535) mapValue!16236)) b!394606))

(assert (= (and b!394605 ((_ is ValueCellFull!4535) mapDefault!16236)) b!394602))

(assert (= start!38234 b!394605))

(declare-fun m!391293 () Bool)

(assert (=> start!38234 m!391293))

(declare-fun m!391295 () Bool)

(assert (=> start!38234 m!391295))

(declare-fun m!391297 () Bool)

(assert (=> mapNonEmpty!16236 m!391297))

(declare-fun m!391299 () Bool)

(assert (=> b!394603 m!391299))

(check-sat (not start!38234) (not b!394603) (not mapNonEmpty!16236) tp_is_empty!9757)
(check-sat)

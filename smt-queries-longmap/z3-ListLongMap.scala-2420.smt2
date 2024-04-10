; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38250 () Bool)

(assert start!38250)

(declare-datatypes ((array!23425 0))(
  ( (array!23426 (arr!11169 (Array (_ BitVec 32) (_ BitVec 64))) (size!11521 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23425)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394666 () Bool)

(declare-datatypes ((V!14117 0))(
  ( (V!14118 (val!4924 Int)) )
))
(declare-datatypes ((ValueCell!4536 0))(
  ( (ValueCellFull!4536 (v!7169 V!14117)) (EmptyCell!4536) )
))
(declare-datatypes ((array!23427 0))(
  ( (array!23428 (arr!11170 (Array (_ BitVec 32) ValueCell!4536)) (size!11522 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23427)

(declare-fun e!238914 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394666 (= e!238914 (and (= (size!11522 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11521 _keys!709) (size!11522 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (= (size!11521 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11521 _keys!709))))))

(declare-fun mapNonEmpty!16239 () Bool)

(declare-fun mapRes!16239 () Bool)

(declare-fun tp!32034 () Bool)

(declare-fun e!238912 () Bool)

(assert (=> mapNonEmpty!16239 (= mapRes!16239 (and tp!32034 e!238912))))

(declare-fun mapKey!16239 () (_ BitVec 32))

(declare-fun mapRest!16239 () (Array (_ BitVec 32) ValueCell!4536))

(declare-fun mapValue!16239 () ValueCell!4536)

(assert (=> mapNonEmpty!16239 (= (arr!11170 _values!549) (store mapRest!16239 mapKey!16239 mapValue!16239))))

(declare-fun b!394667 () Bool)

(declare-fun e!238913 () Bool)

(declare-fun tp_is_empty!9759 () Bool)

(assert (=> b!394667 (= e!238913 tp_is_empty!9759)))

(declare-fun b!394668 () Bool)

(declare-fun e!238916 () Bool)

(assert (=> b!394668 (= e!238916 (and e!238913 mapRes!16239))))

(declare-fun condMapEmpty!16239 () Bool)

(declare-fun mapDefault!16239 () ValueCell!4536)

(assert (=> b!394668 (= condMapEmpty!16239 (= (arr!11170 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4536)) mapDefault!16239)))))

(declare-fun res!226229 () Bool)

(assert (=> start!38250 (=> (not res!226229) (not e!238914))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38250 (= res!226229 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11521 _keys!709))))))

(assert (=> start!38250 e!238914))

(assert (=> start!38250 true))

(declare-fun array_inv!8202 (array!23427) Bool)

(assert (=> start!38250 (and (array_inv!8202 _values!549) e!238916)))

(declare-fun array_inv!8203 (array!23425) Bool)

(assert (=> start!38250 (array_inv!8203 _keys!709)))

(declare-fun mapIsEmpty!16239 () Bool)

(assert (=> mapIsEmpty!16239 mapRes!16239))

(declare-fun b!394669 () Bool)

(assert (=> b!394669 (= e!238912 tp_is_empty!9759)))

(declare-fun b!394670 () Bool)

(declare-fun res!226228 () Bool)

(assert (=> b!394670 (=> (not res!226228) (not e!238914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394670 (= res!226228 (validMask!0 mask!1025))))

(assert (= (and start!38250 res!226229) b!394670))

(assert (= (and b!394670 res!226228) b!394666))

(assert (= (and b!394668 condMapEmpty!16239) mapIsEmpty!16239))

(assert (= (and b!394668 (not condMapEmpty!16239)) mapNonEmpty!16239))

(get-info :version)

(assert (= (and mapNonEmpty!16239 ((_ is ValueCellFull!4536) mapValue!16239)) b!394669))

(assert (= (and b!394668 ((_ is ValueCellFull!4536) mapDefault!16239)) b!394667))

(assert (= start!38250 b!394668))

(declare-fun m!391071 () Bool)

(assert (=> mapNonEmpty!16239 m!391071))

(declare-fun m!391073 () Bool)

(assert (=> start!38250 m!391073))

(declare-fun m!391075 () Bool)

(assert (=> start!38250 m!391075))

(declare-fun m!391077 () Bool)

(assert (=> b!394670 m!391077))

(check-sat (not start!38250) (not b!394670) (not mapNonEmpty!16239) tp_is_empty!9759)
(check-sat)

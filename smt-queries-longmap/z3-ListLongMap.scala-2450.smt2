; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38520 () Bool)

(assert start!38520)

(declare-fun b!398036 () Bool)

(declare-fun res!228665 () Bool)

(declare-fun e!240634 () Bool)

(assert (=> b!398036 (=> (not res!228665) (not e!240634))))

(declare-datatypes ((array!23789 0))(
  ( (array!23790 (arr!11344 (Array (_ BitVec 32) (_ BitVec 64))) (size!11696 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23789)

(declare-datatypes ((List!6563 0))(
  ( (Nil!6560) (Cons!6559 (h!7415 (_ BitVec 64)) (t!11737 List!6563)) )
))
(declare-fun arrayNoDuplicates!0 (array!23789 (_ BitVec 32) List!6563) Bool)

(assert (=> b!398036 (= res!228665 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6560))))

(declare-fun b!398037 () Bool)

(declare-fun res!228668 () Bool)

(assert (=> b!398037 (=> (not res!228668) (not e!240634))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23789 (_ BitVec 32)) Bool)

(assert (=> b!398037 (= res!228668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398038 () Bool)

(declare-fun e!240632 () Bool)

(declare-fun e!240631 () Bool)

(declare-fun mapRes!16530 () Bool)

(assert (=> b!398038 (= e!240632 (and e!240631 mapRes!16530))))

(declare-fun condMapEmpty!16530 () Bool)

(declare-datatypes ((V!14357 0))(
  ( (V!14358 (val!5014 Int)) )
))
(declare-datatypes ((ValueCell!4626 0))(
  ( (ValueCellFull!4626 (v!7261 V!14357)) (EmptyCell!4626) )
))
(declare-datatypes ((array!23791 0))(
  ( (array!23792 (arr!11345 (Array (_ BitVec 32) ValueCell!4626)) (size!11697 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23791)

(declare-fun mapDefault!16530 () ValueCell!4626)

(assert (=> b!398038 (= condMapEmpty!16530 (= (arr!11345 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4626)) mapDefault!16530)))))

(declare-fun b!398039 () Bool)

(declare-fun res!228661 () Bool)

(assert (=> b!398039 (=> (not res!228661) (not e!240634))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398039 (= res!228661 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398040 () Bool)

(declare-fun e!240635 () Bool)

(declare-fun tp_is_empty!9939 () Bool)

(assert (=> b!398040 (= e!240635 tp_is_empty!9939)))

(declare-fun b!398042 () Bool)

(declare-fun e!240636 () Bool)

(assert (=> b!398042 (= e!240634 e!240636)))

(declare-fun res!228660 () Bool)

(assert (=> b!398042 (=> (not res!228660) (not e!240636))))

(declare-fun lt!187396 () array!23789)

(assert (=> b!398042 (= res!228660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187396 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398042 (= lt!187396 (array!23790 (store (arr!11344 _keys!709) i!563 k0!794) (size!11696 _keys!709)))))

(declare-fun mapIsEmpty!16530 () Bool)

(assert (=> mapIsEmpty!16530 mapRes!16530))

(declare-fun b!398043 () Bool)

(assert (=> b!398043 (= e!240631 tp_is_empty!9939)))

(declare-fun res!228662 () Bool)

(assert (=> start!38520 (=> (not res!228662) (not e!240634))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38520 (= res!228662 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11696 _keys!709))))))

(assert (=> start!38520 e!240634))

(assert (=> start!38520 true))

(declare-fun array_inv!8316 (array!23791) Bool)

(assert (=> start!38520 (and (array_inv!8316 _values!549) e!240632)))

(declare-fun array_inv!8317 (array!23789) Bool)

(assert (=> start!38520 (array_inv!8317 _keys!709)))

(declare-fun b!398041 () Bool)

(assert (=> b!398041 (= e!240636 false)))

(declare-fun lt!187397 () Bool)

(assert (=> b!398041 (= lt!187397 (arrayNoDuplicates!0 lt!187396 #b00000000000000000000000000000000 Nil!6560))))

(declare-fun b!398044 () Bool)

(declare-fun res!228667 () Bool)

(assert (=> b!398044 (=> (not res!228667) (not e!240634))))

(assert (=> b!398044 (= res!228667 (or (= (select (arr!11344 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11344 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16530 () Bool)

(declare-fun tp!32325 () Bool)

(assert (=> mapNonEmpty!16530 (= mapRes!16530 (and tp!32325 e!240635))))

(declare-fun mapValue!16530 () ValueCell!4626)

(declare-fun mapRest!16530 () (Array (_ BitVec 32) ValueCell!4626))

(declare-fun mapKey!16530 () (_ BitVec 32))

(assert (=> mapNonEmpty!16530 (= (arr!11345 _values!549) (store mapRest!16530 mapKey!16530 mapValue!16530))))

(declare-fun b!398045 () Bool)

(declare-fun res!228663 () Bool)

(assert (=> b!398045 (=> (not res!228663) (not e!240634))))

(assert (=> b!398045 (= res!228663 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11696 _keys!709))))))

(declare-fun b!398046 () Bool)

(declare-fun res!228669 () Bool)

(assert (=> b!398046 (=> (not res!228669) (not e!240634))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398046 (= res!228669 (and (= (size!11697 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11696 _keys!709) (size!11697 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398047 () Bool)

(declare-fun res!228664 () Bool)

(assert (=> b!398047 (=> (not res!228664) (not e!240634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398047 (= res!228664 (validMask!0 mask!1025))))

(declare-fun b!398048 () Bool)

(declare-fun res!228666 () Bool)

(assert (=> b!398048 (=> (not res!228666) (not e!240634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398048 (= res!228666 (validKeyInArray!0 k0!794))))

(assert (= (and start!38520 res!228662) b!398047))

(assert (= (and b!398047 res!228664) b!398046))

(assert (= (and b!398046 res!228669) b!398037))

(assert (= (and b!398037 res!228668) b!398036))

(assert (= (and b!398036 res!228665) b!398045))

(assert (= (and b!398045 res!228663) b!398048))

(assert (= (and b!398048 res!228666) b!398044))

(assert (= (and b!398044 res!228667) b!398039))

(assert (= (and b!398039 res!228661) b!398042))

(assert (= (and b!398042 res!228660) b!398041))

(assert (= (and b!398038 condMapEmpty!16530) mapIsEmpty!16530))

(assert (= (and b!398038 (not condMapEmpty!16530)) mapNonEmpty!16530))

(get-info :version)

(assert (= (and mapNonEmpty!16530 ((_ is ValueCellFull!4626) mapValue!16530)) b!398040))

(assert (= (and b!398038 ((_ is ValueCellFull!4626) mapDefault!16530)) b!398043))

(assert (= start!38520 b!398038))

(declare-fun m!393055 () Bool)

(assert (=> b!398044 m!393055))

(declare-fun m!393057 () Bool)

(assert (=> b!398041 m!393057))

(declare-fun m!393059 () Bool)

(assert (=> mapNonEmpty!16530 m!393059))

(declare-fun m!393061 () Bool)

(assert (=> b!398048 m!393061))

(declare-fun m!393063 () Bool)

(assert (=> b!398036 m!393063))

(declare-fun m!393065 () Bool)

(assert (=> b!398039 m!393065))

(declare-fun m!393067 () Bool)

(assert (=> b!398047 m!393067))

(declare-fun m!393069 () Bool)

(assert (=> b!398037 m!393069))

(declare-fun m!393071 () Bool)

(assert (=> b!398042 m!393071))

(declare-fun m!393073 () Bool)

(assert (=> b!398042 m!393073))

(declare-fun m!393075 () Bool)

(assert (=> start!38520 m!393075))

(declare-fun m!393077 () Bool)

(assert (=> start!38520 m!393077))

(check-sat (not start!38520) (not b!398036) (not b!398041) (not b!398048) tp_is_empty!9939 (not b!398042) (not b!398039) (not b!398037) (not b!398047) (not mapNonEmpty!16530))
(check-sat)

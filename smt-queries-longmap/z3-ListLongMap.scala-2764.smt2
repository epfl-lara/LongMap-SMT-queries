; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40438 () Bool)

(assert start!40438)

(declare-fun b!444887 () Bool)

(declare-fun res!263882 () Bool)

(declare-fun e!261579 () Bool)

(assert (=> b!444887 (=> (not res!263882) (not e!261579))))

(declare-datatypes ((array!27453 0))(
  ( (array!27454 (arr!13174 (Array (_ BitVec 32) (_ BitVec 64))) (size!13526 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27453)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16869 0))(
  ( (V!16870 (val!5956 Int)) )
))
(declare-datatypes ((ValueCell!5568 0))(
  ( (ValueCellFull!5568 (v!8207 V!16869)) (EmptyCell!5568) )
))
(declare-datatypes ((array!27455 0))(
  ( (array!27456 (arr!13175 (Array (_ BitVec 32) ValueCell!5568)) (size!13527 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27455)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444887 (= res!263882 (and (= (size!13527 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13526 _keys!709) (size!13527 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444888 () Bool)

(declare-fun e!261580 () Bool)

(assert (=> b!444888 (= e!261579 e!261580)))

(declare-fun res!263887 () Bool)

(assert (=> b!444888 (=> (not res!263887) (not e!261580))))

(declare-fun lt!203560 () array!27453)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27453 (_ BitVec 32)) Bool)

(assert (=> b!444888 (= res!263887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203560 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444888 (= lt!203560 (array!27454 (store (arr!13174 _keys!709) i!563 k0!794) (size!13526 _keys!709)))))

(declare-fun mapIsEmpty!19362 () Bool)

(declare-fun mapRes!19362 () Bool)

(assert (=> mapIsEmpty!19362 mapRes!19362))

(declare-fun b!444889 () Bool)

(declare-fun e!261582 () Bool)

(declare-fun tp_is_empty!11823 () Bool)

(assert (=> b!444889 (= e!261582 tp_is_empty!11823)))

(declare-fun b!444890 () Bool)

(declare-fun res!263884 () Bool)

(assert (=> b!444890 (=> (not res!263884) (not e!261579))))

(declare-fun arrayContainsKey!0 (array!27453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444890 (= res!263884 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444891 () Bool)

(declare-fun res!263889 () Bool)

(assert (=> b!444891 (=> (not res!263889) (not e!261579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444891 (= res!263889 (validKeyInArray!0 k0!794))))

(declare-fun b!444892 () Bool)

(declare-fun res!263881 () Bool)

(assert (=> b!444892 (=> (not res!263881) (not e!261579))))

(declare-datatypes ((List!7879 0))(
  ( (Nil!7876) (Cons!7875 (h!8731 (_ BitVec 64)) (t!13637 List!7879)) )
))
(declare-fun arrayNoDuplicates!0 (array!27453 (_ BitVec 32) List!7879) Bool)

(assert (=> b!444892 (= res!263881 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7876))))

(declare-fun res!263885 () Bool)

(assert (=> start!40438 (=> (not res!263885) (not e!261579))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40438 (= res!263885 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13526 _keys!709))))))

(assert (=> start!40438 e!261579))

(assert (=> start!40438 true))

(declare-fun e!261581 () Bool)

(declare-fun array_inv!9552 (array!27455) Bool)

(assert (=> start!40438 (and (array_inv!9552 _values!549) e!261581)))

(declare-fun array_inv!9553 (array!27453) Bool)

(assert (=> start!40438 (array_inv!9553 _keys!709)))

(declare-fun b!444893 () Bool)

(declare-fun res!263890 () Bool)

(assert (=> b!444893 (=> (not res!263890) (not e!261579))))

(assert (=> b!444893 (= res!263890 (or (= (select (arr!13174 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13174 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444894 () Bool)

(declare-fun e!261584 () Bool)

(assert (=> b!444894 (= e!261584 tp_is_empty!11823)))

(declare-fun b!444895 () Bool)

(assert (=> b!444895 (= e!261580 false)))

(declare-fun lt!203561 () Bool)

(assert (=> b!444895 (= lt!203561 (arrayNoDuplicates!0 lt!203560 #b00000000000000000000000000000000 Nil!7876))))

(declare-fun b!444896 () Bool)

(declare-fun res!263886 () Bool)

(assert (=> b!444896 (=> (not res!263886) (not e!261579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444896 (= res!263886 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19362 () Bool)

(declare-fun tp!37344 () Bool)

(assert (=> mapNonEmpty!19362 (= mapRes!19362 (and tp!37344 e!261584))))

(declare-fun mapValue!19362 () ValueCell!5568)

(declare-fun mapKey!19362 () (_ BitVec 32))

(declare-fun mapRest!19362 () (Array (_ BitVec 32) ValueCell!5568))

(assert (=> mapNonEmpty!19362 (= (arr!13175 _values!549) (store mapRest!19362 mapKey!19362 mapValue!19362))))

(declare-fun b!444897 () Bool)

(assert (=> b!444897 (= e!261581 (and e!261582 mapRes!19362))))

(declare-fun condMapEmpty!19362 () Bool)

(declare-fun mapDefault!19362 () ValueCell!5568)

(assert (=> b!444897 (= condMapEmpty!19362 (= (arr!13175 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5568)) mapDefault!19362)))))

(declare-fun b!444898 () Bool)

(declare-fun res!263883 () Bool)

(assert (=> b!444898 (=> (not res!263883) (not e!261579))))

(assert (=> b!444898 (= res!263883 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13526 _keys!709))))))

(declare-fun b!444899 () Bool)

(declare-fun res!263888 () Bool)

(assert (=> b!444899 (=> (not res!263888) (not e!261579))))

(assert (=> b!444899 (= res!263888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40438 res!263885) b!444896))

(assert (= (and b!444896 res!263886) b!444887))

(assert (= (and b!444887 res!263882) b!444899))

(assert (= (and b!444899 res!263888) b!444892))

(assert (= (and b!444892 res!263881) b!444898))

(assert (= (and b!444898 res!263883) b!444891))

(assert (= (and b!444891 res!263889) b!444893))

(assert (= (and b!444893 res!263890) b!444890))

(assert (= (and b!444890 res!263884) b!444888))

(assert (= (and b!444888 res!263887) b!444895))

(assert (= (and b!444897 condMapEmpty!19362) mapIsEmpty!19362))

(assert (= (and b!444897 (not condMapEmpty!19362)) mapNonEmpty!19362))

(get-info :version)

(assert (= (and mapNonEmpty!19362 ((_ is ValueCellFull!5568) mapValue!19362)) b!444894))

(assert (= (and b!444897 ((_ is ValueCellFull!5568) mapDefault!19362)) b!444889))

(assert (= start!40438 b!444897))

(declare-fun m!430597 () Bool)

(assert (=> start!40438 m!430597))

(declare-fun m!430599 () Bool)

(assert (=> start!40438 m!430599))

(declare-fun m!430601 () Bool)

(assert (=> b!444890 m!430601))

(declare-fun m!430603 () Bool)

(assert (=> b!444891 m!430603))

(declare-fun m!430605 () Bool)

(assert (=> b!444888 m!430605))

(declare-fun m!430607 () Bool)

(assert (=> b!444888 m!430607))

(declare-fun m!430609 () Bool)

(assert (=> b!444892 m!430609))

(declare-fun m!430611 () Bool)

(assert (=> b!444895 m!430611))

(declare-fun m!430613 () Bool)

(assert (=> b!444893 m!430613))

(declare-fun m!430615 () Bool)

(assert (=> b!444896 m!430615))

(declare-fun m!430617 () Bool)

(assert (=> mapNonEmpty!19362 m!430617))

(declare-fun m!430619 () Bool)

(assert (=> b!444899 m!430619))

(check-sat (not b!444891) (not b!444899) (not b!444892) tp_is_empty!11823 (not b!444888) (not b!444895) (not b!444896) (not start!40438) (not mapNonEmpty!19362) (not b!444890))
(check-sat)

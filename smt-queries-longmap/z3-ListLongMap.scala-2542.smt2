; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39056 () Bool)

(assert start!39056)

(declare-fun b_free!9337 () Bool)

(declare-fun b_next!9337 () Bool)

(assert (=> start!39056 (= b_free!9337 (not b_next!9337))))

(declare-fun tp!33540 () Bool)

(declare-fun b_and!16697 () Bool)

(assert (=> start!39056 (= tp!33540 b_and!16697)))

(declare-fun mapNonEmpty!17355 () Bool)

(declare-fun mapRes!17355 () Bool)

(declare-fun tp!33539 () Bool)

(declare-fun e!245731 () Bool)

(assert (=> mapNonEmpty!17355 (= mapRes!17355 (and tp!33539 e!245731))))

(declare-datatypes ((V!15091 0))(
  ( (V!15092 (val!5289 Int)) )
))
(declare-datatypes ((ValueCell!4901 0))(
  ( (ValueCellFull!4901 (v!7530 V!15091)) (EmptyCell!4901) )
))
(declare-fun mapRest!17355 () (Array (_ BitVec 32) ValueCell!4901))

(declare-fun mapKey!17355 () (_ BitVec 32))

(declare-datatypes ((array!24837 0))(
  ( (array!24838 (arr!11868 (Array (_ BitVec 32) ValueCell!4901)) (size!12221 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24837)

(declare-fun mapValue!17355 () ValueCell!4901)

(assert (=> mapNonEmpty!17355 (= (arr!11868 _values!549) (store mapRest!17355 mapKey!17355 mapValue!17355))))

(declare-fun b!409916 () Bool)

(declare-fun res!237562 () Bool)

(declare-fun e!245734 () Bool)

(assert (=> b!409916 (=> (not res!237562) (not e!245734))))

(declare-datatypes ((array!24839 0))(
  ( (array!24840 (arr!11869 (Array (_ BitVec 32) (_ BitVec 64))) (size!12222 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24839)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409916 (= res!237562 (and (= (size!12221 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12222 _keys!709) (size!12221 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17355 () Bool)

(assert (=> mapIsEmpty!17355 mapRes!17355))

(declare-fun b!409917 () Bool)

(declare-fun res!237560 () Bool)

(assert (=> b!409917 (=> (not res!237560) (not e!245734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409917 (= res!237560 (validMask!0 mask!1025))))

(declare-fun b!409918 () Bool)

(declare-fun res!237566 () Bool)

(assert (=> b!409918 (=> (not res!237566) (not e!245734))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409918 (= res!237566 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12222 _keys!709))))))

(declare-fun b!409919 () Bool)

(declare-fun res!237569 () Bool)

(assert (=> b!409919 (=> (not res!237569) (not e!245734))))

(assert (=> b!409919 (= res!237569 (or (= (select (arr!11869 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11869 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409920 () Bool)

(declare-fun e!245732 () Bool)

(declare-fun tp_is_empty!10489 () Bool)

(assert (=> b!409920 (= e!245732 tp_is_empty!10489)))

(declare-fun b!409921 () Bool)

(assert (=> b!409921 (= e!245731 tp_is_empty!10489)))

(declare-fun b!409922 () Bool)

(declare-fun res!237563 () Bool)

(assert (=> b!409922 (=> (not res!237563) (not e!245734))))

(declare-datatypes ((List!6858 0))(
  ( (Nil!6855) (Cons!6854 (h!7710 (_ BitVec 64)) (t!12023 List!6858)) )
))
(declare-fun arrayNoDuplicates!0 (array!24839 (_ BitVec 32) List!6858) Bool)

(assert (=> b!409922 (= res!237563 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6855))))

(declare-fun res!237570 () Bool)

(assert (=> start!39056 (=> (not res!237570) (not e!245734))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39056 (= res!237570 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12222 _keys!709))))))

(assert (=> start!39056 e!245734))

(assert (=> start!39056 tp_is_empty!10489))

(assert (=> start!39056 tp!33540))

(assert (=> start!39056 true))

(declare-fun e!245735 () Bool)

(declare-fun array_inv!8702 (array!24837) Bool)

(assert (=> start!39056 (and (array_inv!8702 _values!549) e!245735)))

(declare-fun array_inv!8703 (array!24839) Bool)

(assert (=> start!39056 (array_inv!8703 _keys!709)))

(declare-fun b!409923 () Bool)

(declare-fun res!237564 () Bool)

(assert (=> b!409923 (=> (not res!237564) (not e!245734))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409923 (= res!237564 (validKeyInArray!0 k0!794))))

(declare-fun b!409924 () Bool)

(assert (=> b!409924 (= e!245735 (and e!245732 mapRes!17355))))

(declare-fun condMapEmpty!17355 () Bool)

(declare-fun mapDefault!17355 () ValueCell!4901)

(assert (=> b!409924 (= condMapEmpty!17355 (= (arr!11868 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4901)) mapDefault!17355)))))

(declare-fun b!409925 () Bool)

(declare-fun res!237567 () Bool)

(declare-fun e!245733 () Bool)

(assert (=> b!409925 (=> (not res!237567) (not e!245733))))

(assert (=> b!409925 (= res!237567 (bvsle from!863 i!563))))

(declare-fun b!409926 () Bool)

(declare-fun res!237565 () Bool)

(assert (=> b!409926 (=> (not res!237565) (not e!245734))))

(declare-fun arrayContainsKey!0 (array!24839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409926 (= res!237565 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409927 () Bool)

(declare-fun res!237568 () Bool)

(assert (=> b!409927 (=> (not res!237568) (not e!245733))))

(declare-fun lt!188813 () array!24839)

(assert (=> b!409927 (= res!237568 (arrayNoDuplicates!0 lt!188813 #b00000000000000000000000000000000 Nil!6855))))

(declare-fun b!409928 () Bool)

(declare-fun res!237561 () Bool)

(assert (=> b!409928 (=> (not res!237561) (not e!245734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24839 (_ BitVec 32)) Bool)

(assert (=> b!409928 (= res!237561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409929 () Bool)

(assert (=> b!409929 (= e!245733 false)))

(declare-fun minValue!515 () V!15091)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6846 0))(
  ( (tuple2!6847 (_1!3434 (_ BitVec 64)) (_2!3434 V!15091)) )
))
(declare-datatypes ((List!6859 0))(
  ( (Nil!6856) (Cons!6855 (h!7711 tuple2!6846) (t!12024 List!6859)) )
))
(declare-datatypes ((ListLongMap!5749 0))(
  ( (ListLongMap!5750 (toList!2890 List!6859)) )
))
(declare-fun lt!188812 () ListLongMap!5749)

(declare-fun zeroValue!515 () V!15091)

(declare-fun getCurrentListMapNoExtraKeys!1104 (array!24839 array!24837 (_ BitVec 32) (_ BitVec 32) V!15091 V!15091 (_ BitVec 32) Int) ListLongMap!5749)

(assert (=> b!409929 (= lt!188812 (getCurrentListMapNoExtraKeys!1104 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409930 () Bool)

(assert (=> b!409930 (= e!245734 e!245733)))

(declare-fun res!237559 () Bool)

(assert (=> b!409930 (=> (not res!237559) (not e!245733))))

(assert (=> b!409930 (= res!237559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188813 mask!1025))))

(assert (=> b!409930 (= lt!188813 (array!24840 (store (arr!11869 _keys!709) i!563 k0!794) (size!12222 _keys!709)))))

(assert (= (and start!39056 res!237570) b!409917))

(assert (= (and b!409917 res!237560) b!409916))

(assert (= (and b!409916 res!237562) b!409928))

(assert (= (and b!409928 res!237561) b!409922))

(assert (= (and b!409922 res!237563) b!409918))

(assert (= (and b!409918 res!237566) b!409923))

(assert (= (and b!409923 res!237564) b!409919))

(assert (= (and b!409919 res!237569) b!409926))

(assert (= (and b!409926 res!237565) b!409930))

(assert (= (and b!409930 res!237559) b!409927))

(assert (= (and b!409927 res!237568) b!409925))

(assert (= (and b!409925 res!237567) b!409929))

(assert (= (and b!409924 condMapEmpty!17355) mapIsEmpty!17355))

(assert (= (and b!409924 (not condMapEmpty!17355)) mapNonEmpty!17355))

(get-info :version)

(assert (= (and mapNonEmpty!17355 ((_ is ValueCellFull!4901) mapValue!17355)) b!409921))

(assert (= (and b!409924 ((_ is ValueCellFull!4901) mapDefault!17355)) b!409920))

(assert (= start!39056 b!409924))

(declare-fun m!400053 () Bool)

(assert (=> b!409923 m!400053))

(declare-fun m!400055 () Bool)

(assert (=> b!409930 m!400055))

(declare-fun m!400057 () Bool)

(assert (=> b!409930 m!400057))

(declare-fun m!400059 () Bool)

(assert (=> b!409919 m!400059))

(declare-fun m!400061 () Bool)

(assert (=> start!39056 m!400061))

(declare-fun m!400063 () Bool)

(assert (=> start!39056 m!400063))

(declare-fun m!400065 () Bool)

(assert (=> b!409917 m!400065))

(declare-fun m!400067 () Bool)

(assert (=> b!409929 m!400067))

(declare-fun m!400069 () Bool)

(assert (=> b!409926 m!400069))

(declare-fun m!400071 () Bool)

(assert (=> b!409928 m!400071))

(declare-fun m!400073 () Bool)

(assert (=> b!409922 m!400073))

(declare-fun m!400075 () Bool)

(assert (=> mapNonEmpty!17355 m!400075))

(declare-fun m!400077 () Bool)

(assert (=> b!409927 m!400077))

(check-sat (not b!409926) (not b!409917) (not b!409923) (not start!39056) (not b!409929) (not b!409930) (not mapNonEmpty!17355) (not b!409927) b_and!16697 tp_is_empty!10489 (not b!409928) (not b_next!9337) (not b!409922))
(check-sat b_and!16697 (not b_next!9337))

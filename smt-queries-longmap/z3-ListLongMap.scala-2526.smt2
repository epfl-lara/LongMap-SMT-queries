; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38960 () Bool)

(assert start!38960)

(declare-fun b!407914 () Bool)

(declare-fun e!244867 () Bool)

(declare-fun e!244871 () Bool)

(assert (=> b!407914 (= e!244867 e!244871)))

(declare-fun res!235998 () Bool)

(assert (=> b!407914 (=> (not res!235998) (not e!244871))))

(declare-datatypes ((array!24653 0))(
  ( (array!24654 (arr!11776 (Array (_ BitVec 32) (_ BitVec 64))) (size!12129 (_ BitVec 32))) )
))
(declare-fun lt!188525 () array!24653)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24653 (_ BitVec 32)) Bool)

(assert (=> b!407914 (= res!235998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188525 mask!1025))))

(declare-fun _keys!709 () array!24653)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407914 (= lt!188525 (array!24654 (store (arr!11776 _keys!709) i!563 k0!794) (size!12129 _keys!709)))))

(declare-fun b!407915 () Bool)

(declare-fun res!235996 () Bool)

(assert (=> b!407915 (=> (not res!235996) (not e!244867))))

(declare-fun arrayContainsKey!0 (array!24653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407915 (= res!235996 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407916 () Bool)

(declare-fun e!244869 () Bool)

(declare-fun tp_is_empty!10393 () Bool)

(assert (=> b!407916 (= e!244869 tp_is_empty!10393)))

(declare-fun b!407917 () Bool)

(declare-fun res!235989 () Bool)

(assert (=> b!407917 (=> (not res!235989) (not e!244867))))

(declare-datatypes ((List!6802 0))(
  ( (Nil!6799) (Cons!6798 (h!7654 (_ BitVec 64)) (t!11967 List!6802)) )
))
(declare-fun arrayNoDuplicates!0 (array!24653 (_ BitVec 32) List!6802) Bool)

(assert (=> b!407917 (= res!235989 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6799))))

(declare-fun mapIsEmpty!17211 () Bool)

(declare-fun mapRes!17211 () Bool)

(assert (=> mapIsEmpty!17211 mapRes!17211))

(declare-fun res!235997 () Bool)

(assert (=> start!38960 (=> (not res!235997) (not e!244867))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38960 (= res!235997 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12129 _keys!709))))))

(assert (=> start!38960 e!244867))

(assert (=> start!38960 true))

(declare-datatypes ((V!14963 0))(
  ( (V!14964 (val!5241 Int)) )
))
(declare-datatypes ((ValueCell!4853 0))(
  ( (ValueCellFull!4853 (v!7482 V!14963)) (EmptyCell!4853) )
))
(declare-datatypes ((array!24655 0))(
  ( (array!24656 (arr!11777 (Array (_ BitVec 32) ValueCell!4853)) (size!12130 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24655)

(declare-fun e!244868 () Bool)

(declare-fun array_inv!8636 (array!24655) Bool)

(assert (=> start!38960 (and (array_inv!8636 _values!549) e!244868)))

(declare-fun array_inv!8637 (array!24653) Bool)

(assert (=> start!38960 (array_inv!8637 _keys!709)))

(declare-fun b!407918 () Bool)

(declare-fun e!244872 () Bool)

(assert (=> b!407918 (= e!244872 tp_is_empty!10393)))

(declare-fun b!407919 () Bool)

(declare-fun res!235994 () Bool)

(assert (=> b!407919 (=> (not res!235994) (not e!244867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407919 (= res!235994 (validMask!0 mask!1025))))

(declare-fun b!407920 () Bool)

(declare-fun res!235991 () Bool)

(assert (=> b!407920 (=> (not res!235991) (not e!244867))))

(assert (=> b!407920 (= res!235991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17211 () Bool)

(declare-fun tp!33330 () Bool)

(assert (=> mapNonEmpty!17211 (= mapRes!17211 (and tp!33330 e!244872))))

(declare-fun mapValue!17211 () ValueCell!4853)

(declare-fun mapRest!17211 () (Array (_ BitVec 32) ValueCell!4853))

(declare-fun mapKey!17211 () (_ BitVec 32))

(assert (=> mapNonEmpty!17211 (= (arr!11777 _values!549) (store mapRest!17211 mapKey!17211 mapValue!17211))))

(declare-fun b!407921 () Bool)

(declare-fun res!235990 () Bool)

(assert (=> b!407921 (=> (not res!235990) (not e!244867))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407921 (= res!235990 (and (= (size!12130 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12129 _keys!709) (size!12130 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407922 () Bool)

(assert (=> b!407922 (= e!244871 false)))

(declare-fun lt!188524 () Bool)

(assert (=> b!407922 (= lt!188524 (arrayNoDuplicates!0 lt!188525 #b00000000000000000000000000000000 Nil!6799))))

(declare-fun b!407923 () Bool)

(declare-fun res!235993 () Bool)

(assert (=> b!407923 (=> (not res!235993) (not e!244867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407923 (= res!235993 (validKeyInArray!0 k0!794))))

(declare-fun b!407924 () Bool)

(assert (=> b!407924 (= e!244868 (and e!244869 mapRes!17211))))

(declare-fun condMapEmpty!17211 () Bool)

(declare-fun mapDefault!17211 () ValueCell!4853)

(assert (=> b!407924 (= condMapEmpty!17211 (= (arr!11777 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4853)) mapDefault!17211)))))

(declare-fun b!407925 () Bool)

(declare-fun res!235992 () Bool)

(assert (=> b!407925 (=> (not res!235992) (not e!244867))))

(assert (=> b!407925 (= res!235992 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12129 _keys!709))))))

(declare-fun b!407926 () Bool)

(declare-fun res!235995 () Bool)

(assert (=> b!407926 (=> (not res!235995) (not e!244867))))

(assert (=> b!407926 (= res!235995 (or (= (select (arr!11776 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11776 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38960 res!235997) b!407919))

(assert (= (and b!407919 res!235994) b!407921))

(assert (= (and b!407921 res!235990) b!407920))

(assert (= (and b!407920 res!235991) b!407917))

(assert (= (and b!407917 res!235989) b!407925))

(assert (= (and b!407925 res!235992) b!407923))

(assert (= (and b!407923 res!235993) b!407926))

(assert (= (and b!407926 res!235995) b!407915))

(assert (= (and b!407915 res!235996) b!407914))

(assert (= (and b!407914 res!235998) b!407922))

(assert (= (and b!407924 condMapEmpty!17211) mapIsEmpty!17211))

(assert (= (and b!407924 (not condMapEmpty!17211)) mapNonEmpty!17211))

(get-info :version)

(assert (= (and mapNonEmpty!17211 ((_ is ValueCellFull!4853) mapValue!17211)) b!407918))

(assert (= (and b!407924 ((_ is ValueCellFull!4853) mapDefault!17211)) b!407916))

(assert (= start!38960 b!407924))

(declare-fun m!398859 () Bool)

(assert (=> b!407919 m!398859))

(declare-fun m!398861 () Bool)

(assert (=> start!38960 m!398861))

(declare-fun m!398863 () Bool)

(assert (=> start!38960 m!398863))

(declare-fun m!398865 () Bool)

(assert (=> b!407920 m!398865))

(declare-fun m!398867 () Bool)

(assert (=> b!407914 m!398867))

(declare-fun m!398869 () Bool)

(assert (=> b!407914 m!398869))

(declare-fun m!398871 () Bool)

(assert (=> b!407917 m!398871))

(declare-fun m!398873 () Bool)

(assert (=> b!407922 m!398873))

(declare-fun m!398875 () Bool)

(assert (=> b!407926 m!398875))

(declare-fun m!398877 () Bool)

(assert (=> mapNonEmpty!17211 m!398877))

(declare-fun m!398879 () Bool)

(assert (=> b!407915 m!398879))

(declare-fun m!398881 () Bool)

(assert (=> b!407923 m!398881))

(check-sat tp_is_empty!10393 (not b!407920) (not b!407914) (not start!38960) (not b!407922) (not b!407923) (not mapNonEmpty!17211) (not b!407915) (not b!407919) (not b!407917))
(check-sat)

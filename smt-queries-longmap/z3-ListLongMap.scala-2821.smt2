; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40876 () Bool)

(assert start!40876)

(declare-fun b_free!10825 () Bool)

(declare-fun b_next!10825 () Bool)

(assert (=> start!40876 (= b_free!10825 (not b_next!10825))))

(declare-fun tp!38302 () Bool)

(declare-fun b_and!18941 () Bool)

(assert (=> start!40876 (= tp!38302 b_and!18941)))

(declare-fun b!453916 () Bool)

(declare-fun res!270435 () Bool)

(declare-fun e!265605 () Bool)

(assert (=> b!453916 (=> (not res!270435) (not e!265605))))

(declare-datatypes ((array!28123 0))(
  ( (array!28124 (arr!13505 (Array (_ BitVec 32) (_ BitVec 64))) (size!13858 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28123)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453916 (= res!270435 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!270445 () Bool)

(assert (=> start!40876 (=> (not res!270445) (not e!265605))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40876 (= res!270445 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13858 _keys!709))))))

(assert (=> start!40876 e!265605))

(declare-fun tp_is_empty!12163 () Bool)

(assert (=> start!40876 tp_is_empty!12163))

(assert (=> start!40876 tp!38302))

(assert (=> start!40876 true))

(declare-datatypes ((V!17323 0))(
  ( (V!17324 (val!6126 Int)) )
))
(declare-datatypes ((ValueCell!5738 0))(
  ( (ValueCellFull!5738 (v!8386 V!17323)) (EmptyCell!5738) )
))
(declare-datatypes ((array!28125 0))(
  ( (array!28126 (arr!13506 (Array (_ BitVec 32) ValueCell!5738)) (size!13859 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28125)

(declare-fun e!265604 () Bool)

(declare-fun array_inv!9840 (array!28125) Bool)

(assert (=> start!40876 (and (array_inv!9840 _values!549) e!265604)))

(declare-fun array_inv!9841 (array!28123) Bool)

(assert (=> start!40876 (array_inv!9841 _keys!709)))

(declare-fun b!453917 () Bool)

(declare-fun e!265608 () Bool)

(declare-fun mapRes!19885 () Bool)

(assert (=> b!453917 (= e!265604 (and e!265608 mapRes!19885))))

(declare-fun condMapEmpty!19885 () Bool)

(declare-fun mapDefault!19885 () ValueCell!5738)

(assert (=> b!453917 (= condMapEmpty!19885 (= (arr!13506 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5738)) mapDefault!19885)))))

(declare-fun b!453918 () Bool)

(declare-fun res!270438 () Bool)

(assert (=> b!453918 (=> (not res!270438) (not e!265605))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453918 (= res!270438 (validMask!0 mask!1025))))

(declare-fun b!453919 () Bool)

(declare-fun e!265607 () Bool)

(assert (=> b!453919 (= e!265607 tp_is_empty!12163)))

(declare-fun b!453920 () Bool)

(declare-fun res!270446 () Bool)

(declare-fun e!265609 () Bool)

(assert (=> b!453920 (=> (not res!270446) (not e!265609))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453920 (= res!270446 (bvsle from!863 i!563))))

(declare-fun b!453921 () Bool)

(declare-fun res!270442 () Bool)

(assert (=> b!453921 (=> (not res!270442) (not e!265609))))

(declare-fun lt!205852 () array!28123)

(declare-datatypes ((List!8139 0))(
  ( (Nil!8136) (Cons!8135 (h!8991 (_ BitVec 64)) (t!13958 List!8139)) )
))
(declare-fun arrayNoDuplicates!0 (array!28123 (_ BitVec 32) List!8139) Bool)

(assert (=> b!453921 (= res!270442 (arrayNoDuplicates!0 lt!205852 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun b!453922 () Bool)

(declare-fun res!270440 () Bool)

(assert (=> b!453922 (=> (not res!270440) (not e!265605))))

(assert (=> b!453922 (= res!270440 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun b!453923 () Bool)

(assert (=> b!453923 (= e!265609 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17323)

(declare-fun v!412 () V!17323)

(declare-fun minValue!515 () V!17323)

(declare-datatypes ((tuple2!8080 0))(
  ( (tuple2!8081 (_1!4051 (_ BitVec 64)) (_2!4051 V!17323)) )
))
(declare-datatypes ((List!8140 0))(
  ( (Nil!8137) (Cons!8136 (h!8992 tuple2!8080) (t!13959 List!8140)) )
))
(declare-datatypes ((ListLongMap!6983 0))(
  ( (ListLongMap!6984 (toList!3507 List!8140)) )
))
(declare-fun lt!205853 () ListLongMap!6983)

(declare-fun getCurrentListMapNoExtraKeys!1702 (array!28123 array!28125 (_ BitVec 32) (_ BitVec 32) V!17323 V!17323 (_ BitVec 32) Int) ListLongMap!6983)

(assert (=> b!453923 (= lt!205853 (getCurrentListMapNoExtraKeys!1702 lt!205852 (array!28126 (store (arr!13506 _values!549) i!563 (ValueCellFull!5738 v!412)) (size!13859 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205851 () ListLongMap!6983)

(assert (=> b!453923 (= lt!205851 (getCurrentListMapNoExtraKeys!1702 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19885 () Bool)

(declare-fun tp!38301 () Bool)

(assert (=> mapNonEmpty!19885 (= mapRes!19885 (and tp!38301 e!265607))))

(declare-fun mapKey!19885 () (_ BitVec 32))

(declare-fun mapValue!19885 () ValueCell!5738)

(declare-fun mapRest!19885 () (Array (_ BitVec 32) ValueCell!5738))

(assert (=> mapNonEmpty!19885 (= (arr!13506 _values!549) (store mapRest!19885 mapKey!19885 mapValue!19885))))

(declare-fun b!453924 () Bool)

(declare-fun res!270437 () Bool)

(assert (=> b!453924 (=> (not res!270437) (not e!265605))))

(assert (=> b!453924 (= res!270437 (and (= (size!13859 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13858 _keys!709) (size!13859 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19885 () Bool)

(assert (=> mapIsEmpty!19885 mapRes!19885))

(declare-fun b!453925 () Bool)

(declare-fun res!270439 () Bool)

(assert (=> b!453925 (=> (not res!270439) (not e!265605))))

(assert (=> b!453925 (= res!270439 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13858 _keys!709))))))

(declare-fun b!453926 () Bool)

(assert (=> b!453926 (= e!265608 tp_is_empty!12163)))

(declare-fun b!453927 () Bool)

(assert (=> b!453927 (= e!265605 e!265609)))

(declare-fun res!270443 () Bool)

(assert (=> b!453927 (=> (not res!270443) (not e!265609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28123 (_ BitVec 32)) Bool)

(assert (=> b!453927 (= res!270443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205852 mask!1025))))

(assert (=> b!453927 (= lt!205852 (array!28124 (store (arr!13505 _keys!709) i!563 k0!794) (size!13858 _keys!709)))))

(declare-fun b!453928 () Bool)

(declare-fun res!270441 () Bool)

(assert (=> b!453928 (=> (not res!270441) (not e!265605))))

(assert (=> b!453928 (= res!270441 (or (= (select (arr!13505 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13505 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453929 () Bool)

(declare-fun res!270436 () Bool)

(assert (=> b!453929 (=> (not res!270436) (not e!265605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453929 (= res!270436 (validKeyInArray!0 k0!794))))

(declare-fun b!453930 () Bool)

(declare-fun res!270444 () Bool)

(assert (=> b!453930 (=> (not res!270444) (not e!265605))))

(assert (=> b!453930 (= res!270444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40876 res!270445) b!453918))

(assert (= (and b!453918 res!270438) b!453924))

(assert (= (and b!453924 res!270437) b!453930))

(assert (= (and b!453930 res!270444) b!453922))

(assert (= (and b!453922 res!270440) b!453925))

(assert (= (and b!453925 res!270439) b!453929))

(assert (= (and b!453929 res!270436) b!453928))

(assert (= (and b!453928 res!270441) b!453916))

(assert (= (and b!453916 res!270435) b!453927))

(assert (= (and b!453927 res!270443) b!453921))

(assert (= (and b!453921 res!270442) b!453920))

(assert (= (and b!453920 res!270446) b!453923))

(assert (= (and b!453917 condMapEmpty!19885) mapIsEmpty!19885))

(assert (= (and b!453917 (not condMapEmpty!19885)) mapNonEmpty!19885))

(get-info :version)

(assert (= (and mapNonEmpty!19885 ((_ is ValueCellFull!5738) mapValue!19885)) b!453919))

(assert (= (and b!453917 ((_ is ValueCellFull!5738) mapDefault!19885)) b!453926))

(assert (= start!40876 b!453917))

(declare-fun m!437657 () Bool)

(assert (=> b!453927 m!437657))

(declare-fun m!437659 () Bool)

(assert (=> b!453927 m!437659))

(declare-fun m!437661 () Bool)

(assert (=> b!453916 m!437661))

(declare-fun m!437663 () Bool)

(assert (=> b!453918 m!437663))

(declare-fun m!437665 () Bool)

(assert (=> b!453930 m!437665))

(declare-fun m!437667 () Bool)

(assert (=> b!453921 m!437667))

(declare-fun m!437669 () Bool)

(assert (=> b!453922 m!437669))

(declare-fun m!437671 () Bool)

(assert (=> b!453923 m!437671))

(declare-fun m!437673 () Bool)

(assert (=> b!453923 m!437673))

(declare-fun m!437675 () Bool)

(assert (=> b!453923 m!437675))

(declare-fun m!437677 () Bool)

(assert (=> mapNonEmpty!19885 m!437677))

(declare-fun m!437679 () Bool)

(assert (=> b!453929 m!437679))

(declare-fun m!437681 () Bool)

(assert (=> start!40876 m!437681))

(declare-fun m!437683 () Bool)

(assert (=> start!40876 m!437683))

(declare-fun m!437685 () Bool)

(assert (=> b!453928 m!437685))

(check-sat (not b!453916) (not b!453929) (not b!453918) (not b_next!10825) tp_is_empty!12163 b_and!18941 (not b!453923) (not b!453921) (not b!453927) (not start!40876) (not mapNonEmpty!19885) (not b!453922) (not b!453930))
(check-sat b_and!18941 (not b_next!10825))

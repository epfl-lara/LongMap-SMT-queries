; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40128 () Bool)

(assert start!40128)

(declare-fun b_free!10395 () Bool)

(declare-fun b_next!10395 () Bool)

(assert (=> start!40128 (= b_free!10395 (not b_next!10395))))

(declare-fun tp!36713 () Bool)

(declare-fun b_and!18363 () Bool)

(assert (=> start!40128 (= tp!36713 b_and!18363)))

(declare-fun b!438836 () Bool)

(declare-fun res!259206 () Bool)

(declare-fun e!258789 () Bool)

(assert (=> b!438836 (=> (not res!259206) (not e!258789))))

(declare-datatypes ((array!26911 0))(
  ( (array!26912 (arr!12905 (Array (_ BitVec 32) (_ BitVec 64))) (size!13257 (_ BitVec 32))) )
))
(declare-fun lt!202081 () array!26911)

(declare-datatypes ((List!7718 0))(
  ( (Nil!7715) (Cons!7714 (h!8570 (_ BitVec 64)) (t!13474 List!7718)) )
))
(declare-fun arrayNoDuplicates!0 (array!26911 (_ BitVec 32) List!7718) Bool)

(assert (=> b!438836 (= res!259206 (arrayNoDuplicates!0 lt!202081 #b00000000000000000000000000000000 Nil!7715))))

(declare-fun b!438837 () Bool)

(declare-fun res!259199 () Bool)

(declare-fun e!258791 () Bool)

(assert (=> b!438837 (=> (not res!259199) (not e!258791))))

(declare-fun _keys!709 () array!26911)

(assert (=> b!438837 (= res!259199 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7715))))

(declare-fun res!259201 () Bool)

(assert (=> start!40128 (=> (not res!259201) (not e!258791))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40128 (= res!259201 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13257 _keys!709))))))

(assert (=> start!40128 e!258791))

(declare-fun tp_is_empty!11547 () Bool)

(assert (=> start!40128 tp_is_empty!11547))

(assert (=> start!40128 tp!36713))

(assert (=> start!40128 true))

(declare-datatypes ((V!16501 0))(
  ( (V!16502 (val!5818 Int)) )
))
(declare-datatypes ((ValueCell!5430 0))(
  ( (ValueCellFull!5430 (v!8065 V!16501)) (EmptyCell!5430) )
))
(declare-datatypes ((array!26913 0))(
  ( (array!26914 (arr!12906 (Array (_ BitVec 32) ValueCell!5430)) (size!13258 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26913)

(declare-fun e!258794 () Bool)

(declare-fun array_inv!9372 (array!26913) Bool)

(assert (=> start!40128 (and (array_inv!9372 _values!549) e!258794)))

(declare-fun array_inv!9373 (array!26911) Bool)

(assert (=> start!40128 (array_inv!9373 _keys!709)))

(declare-fun b!438838 () Bool)

(declare-fun res!259198 () Bool)

(assert (=> b!438838 (=> (not res!259198) (not e!258791))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!438838 (= res!259198 (and (= (size!13258 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13257 _keys!709) (size!13258 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438839 () Bool)

(declare-fun res!259200 () Bool)

(assert (=> b!438839 (=> (not res!259200) (not e!258791))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438839 (= res!259200 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13257 _keys!709))))))

(declare-fun b!438840 () Bool)

(declare-fun res!259196 () Bool)

(assert (=> b!438840 (=> (not res!259196) (not e!258791))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438840 (= res!259196 (validKeyInArray!0 k0!794))))

(declare-fun b!438841 () Bool)

(declare-fun res!259205 () Bool)

(assert (=> b!438841 (=> (not res!259205) (not e!258791))))

(assert (=> b!438841 (= res!259205 (or (= (select (arr!12905 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12905 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438842 () Bool)

(declare-fun res!259202 () Bool)

(assert (=> b!438842 (=> (not res!259202) (not e!258791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26911 (_ BitVec 32)) Bool)

(assert (=> b!438842 (= res!259202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18942 () Bool)

(declare-fun mapRes!18942 () Bool)

(declare-fun tp!36714 () Bool)

(declare-fun e!258790 () Bool)

(assert (=> mapNonEmpty!18942 (= mapRes!18942 (and tp!36714 e!258790))))

(declare-fun mapValue!18942 () ValueCell!5430)

(declare-fun mapRest!18942 () (Array (_ BitVec 32) ValueCell!5430))

(declare-fun mapKey!18942 () (_ BitVec 32))

(assert (=> mapNonEmpty!18942 (= (arr!12906 _values!549) (store mapRest!18942 mapKey!18942 mapValue!18942))))

(declare-fun b!438843 () Bool)

(assert (=> b!438843 (= e!258790 tp_is_empty!11547)))

(declare-fun b!438844 () Bool)

(declare-fun res!259194 () Bool)

(assert (=> b!438844 (=> (not res!259194) (not e!258791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438844 (= res!259194 (validMask!0 mask!1025))))

(declare-fun b!438845 () Bool)

(declare-fun e!258795 () Bool)

(assert (=> b!438845 (= e!258795 (not true))))

(declare-fun minValue!515 () V!16501)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16501)

(declare-fun lt!202085 () array!26913)

(declare-fun v!412 () V!16501)

(declare-datatypes ((tuple2!7720 0))(
  ( (tuple2!7721 (_1!3871 (_ BitVec 64)) (_2!3871 V!16501)) )
))
(declare-datatypes ((List!7719 0))(
  ( (Nil!7716) (Cons!7715 (h!8571 tuple2!7720) (t!13475 List!7719)) )
))
(declare-datatypes ((ListLongMap!6633 0))(
  ( (ListLongMap!6634 (toList!3332 List!7719)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1521 (array!26911 array!26913 (_ BitVec 32) (_ BitVec 32) V!16501 V!16501 (_ BitVec 32) Int) ListLongMap!6633)

(declare-fun +!1475 (ListLongMap!6633 tuple2!7720) ListLongMap!6633)

(assert (=> b!438845 (= (getCurrentListMapNoExtraKeys!1521 lt!202081 lt!202085 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1475 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7721 k0!794 v!412)))))

(declare-datatypes ((Unit!13054 0))(
  ( (Unit!13055) )
))
(declare-fun lt!202084 () Unit!13054)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!644 (array!26911 array!26913 (_ BitVec 32) (_ BitVec 32) V!16501 V!16501 (_ BitVec 32) (_ BitVec 64) V!16501 (_ BitVec 32) Int) Unit!13054)

(assert (=> b!438845 (= lt!202084 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!644 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438846 () Bool)

(assert (=> b!438846 (= e!258791 e!258789)))

(declare-fun res!259204 () Bool)

(assert (=> b!438846 (=> (not res!259204) (not e!258789))))

(assert (=> b!438846 (= res!259204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202081 mask!1025))))

(assert (=> b!438846 (= lt!202081 (array!26912 (store (arr!12905 _keys!709) i!563 k0!794) (size!13257 _keys!709)))))

(declare-fun b!438847 () Bool)

(declare-fun e!258793 () Bool)

(assert (=> b!438847 (= e!258793 tp_is_empty!11547)))

(declare-fun b!438848 () Bool)

(assert (=> b!438848 (= e!258789 e!258795)))

(declare-fun res!259203 () Bool)

(assert (=> b!438848 (=> (not res!259203) (not e!258795))))

(assert (=> b!438848 (= res!259203 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202083 () ListLongMap!6633)

(assert (=> b!438848 (= lt!202083 (getCurrentListMapNoExtraKeys!1521 lt!202081 lt!202085 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438848 (= lt!202085 (array!26914 (store (arr!12906 _values!549) i!563 (ValueCellFull!5430 v!412)) (size!13258 _values!549)))))

(declare-fun lt!202082 () ListLongMap!6633)

(assert (=> b!438848 (= lt!202082 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18942 () Bool)

(assert (=> mapIsEmpty!18942 mapRes!18942))

(declare-fun b!438849 () Bool)

(declare-fun res!259195 () Bool)

(assert (=> b!438849 (=> (not res!259195) (not e!258789))))

(assert (=> b!438849 (= res!259195 (bvsle from!863 i!563))))

(declare-fun b!438850 () Bool)

(assert (=> b!438850 (= e!258794 (and e!258793 mapRes!18942))))

(declare-fun condMapEmpty!18942 () Bool)

(declare-fun mapDefault!18942 () ValueCell!5430)

(assert (=> b!438850 (= condMapEmpty!18942 (= (arr!12906 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5430)) mapDefault!18942)))))

(declare-fun b!438851 () Bool)

(declare-fun res!259197 () Bool)

(assert (=> b!438851 (=> (not res!259197) (not e!258791))))

(declare-fun arrayContainsKey!0 (array!26911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438851 (= res!259197 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40128 res!259201) b!438844))

(assert (= (and b!438844 res!259194) b!438838))

(assert (= (and b!438838 res!259198) b!438842))

(assert (= (and b!438842 res!259202) b!438837))

(assert (= (and b!438837 res!259199) b!438839))

(assert (= (and b!438839 res!259200) b!438840))

(assert (= (and b!438840 res!259196) b!438841))

(assert (= (and b!438841 res!259205) b!438851))

(assert (= (and b!438851 res!259197) b!438846))

(assert (= (and b!438846 res!259204) b!438836))

(assert (= (and b!438836 res!259206) b!438849))

(assert (= (and b!438849 res!259195) b!438848))

(assert (= (and b!438848 res!259203) b!438845))

(assert (= (and b!438850 condMapEmpty!18942) mapIsEmpty!18942))

(assert (= (and b!438850 (not condMapEmpty!18942)) mapNonEmpty!18942))

(get-info :version)

(assert (= (and mapNonEmpty!18942 ((_ is ValueCellFull!5430) mapValue!18942)) b!438843))

(assert (= (and b!438850 ((_ is ValueCellFull!5430) mapDefault!18942)) b!438847))

(assert (= start!40128 b!438850))

(declare-fun m!426215 () Bool)

(assert (=> b!438848 m!426215))

(declare-fun m!426217 () Bool)

(assert (=> b!438848 m!426217))

(declare-fun m!426219 () Bool)

(assert (=> b!438848 m!426219))

(declare-fun m!426221 () Bool)

(assert (=> b!438840 m!426221))

(declare-fun m!426223 () Bool)

(assert (=> b!438837 m!426223))

(declare-fun m!426225 () Bool)

(assert (=> b!438842 m!426225))

(declare-fun m!426227 () Bool)

(assert (=> b!438844 m!426227))

(declare-fun m!426229 () Bool)

(assert (=> b!438851 m!426229))

(declare-fun m!426231 () Bool)

(assert (=> b!438846 m!426231))

(declare-fun m!426233 () Bool)

(assert (=> b!438846 m!426233))

(declare-fun m!426235 () Bool)

(assert (=> b!438845 m!426235))

(declare-fun m!426237 () Bool)

(assert (=> b!438845 m!426237))

(assert (=> b!438845 m!426237))

(declare-fun m!426239 () Bool)

(assert (=> b!438845 m!426239))

(declare-fun m!426241 () Bool)

(assert (=> b!438845 m!426241))

(declare-fun m!426243 () Bool)

(assert (=> mapNonEmpty!18942 m!426243))

(declare-fun m!426245 () Bool)

(assert (=> b!438841 m!426245))

(declare-fun m!426247 () Bool)

(assert (=> b!438836 m!426247))

(declare-fun m!426249 () Bool)

(assert (=> start!40128 m!426249))

(declare-fun m!426251 () Bool)

(assert (=> start!40128 m!426251))

(check-sat (not b!438837) (not b!438842) (not b!438845) (not b!438846) (not b!438844) tp_is_empty!11547 (not b!438840) (not b!438836) (not mapNonEmpty!18942) (not b_next!10395) (not start!40128) (not b!438851) (not b!438848) b_and!18363)
(check-sat b_and!18363 (not b_next!10395))

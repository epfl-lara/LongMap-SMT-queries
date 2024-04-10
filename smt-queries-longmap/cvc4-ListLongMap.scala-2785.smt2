; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40602 () Bool)

(assert start!40602)

(declare-fun b_free!10613 () Bool)

(declare-fun b_next!10613 () Bool)

(assert (=> start!40602 (= b_free!10613 (not b_next!10613))))

(declare-fun tp!37659 () Bool)

(declare-fun b_and!18621 () Bool)

(assert (=> start!40602 (= tp!37659 b_and!18621)))

(declare-fun mapIsEmpty!19560 () Bool)

(declare-fun mapRes!19560 () Bool)

(assert (=> mapIsEmpty!19560 mapRes!19560))

(declare-fun b!447962 () Bool)

(declare-fun e!262940 () Bool)

(declare-fun e!262936 () Bool)

(assert (=> b!447962 (= e!262940 e!262936)))

(declare-fun res!266161 () Bool)

(assert (=> b!447962 (=> (not res!266161) (not e!262936))))

(declare-datatypes ((array!27709 0))(
  ( (array!27710 (arr!13300 (Array (_ BitVec 32) (_ BitVec 64))) (size!13652 (_ BitVec 32))) )
))
(declare-fun lt!204072 () array!27709)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27709 (_ BitVec 32)) Bool)

(assert (=> b!447962 (= res!266161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204072 mask!1025))))

(declare-fun _keys!709 () array!27709)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447962 (= lt!204072 (array!27710 (store (arr!13300 _keys!709) i!563 k!794) (size!13652 _keys!709)))))

(declare-fun b!447963 () Bool)

(declare-fun res!266160 () Bool)

(assert (=> b!447963 (=> (not res!266160) (not e!262940))))

(assert (=> b!447963 (= res!266160 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13652 _keys!709))))))

(declare-fun b!447965 () Bool)

(assert (=> b!447965 (= e!262936 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17039 0))(
  ( (V!17040 (val!6020 Int)) )
))
(declare-fun minValue!515 () V!17039)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7894 0))(
  ( (tuple2!7895 (_1!3958 (_ BitVec 64)) (_2!3958 V!17039)) )
))
(declare-datatypes ((List!7959 0))(
  ( (Nil!7956) (Cons!7955 (h!8811 tuple2!7894) (t!13721 List!7959)) )
))
(declare-datatypes ((ListLongMap!6807 0))(
  ( (ListLongMap!6808 (toList!3419 List!7959)) )
))
(declare-fun lt!204071 () ListLongMap!6807)

(declare-datatypes ((ValueCell!5632 0))(
  ( (ValueCellFull!5632 (v!8275 V!17039)) (EmptyCell!5632) )
))
(declare-datatypes ((array!27711 0))(
  ( (array!27712 (arr!13301 (Array (_ BitVec 32) ValueCell!5632)) (size!13653 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27711)

(declare-fun zeroValue!515 () V!17039)

(declare-fun v!412 () V!17039)

(declare-fun getCurrentListMapNoExtraKeys!1605 (array!27709 array!27711 (_ BitVec 32) (_ BitVec 32) V!17039 V!17039 (_ BitVec 32) Int) ListLongMap!6807)

(assert (=> b!447965 (= lt!204071 (getCurrentListMapNoExtraKeys!1605 lt!204072 (array!27712 (store (arr!13301 _values!549) i!563 (ValueCellFull!5632 v!412)) (size!13653 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204070 () ListLongMap!6807)

(assert (=> b!447965 (= lt!204070 (getCurrentListMapNoExtraKeys!1605 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447966 () Bool)

(declare-fun e!262939 () Bool)

(declare-fun tp_is_empty!11951 () Bool)

(assert (=> b!447966 (= e!262939 tp_is_empty!11951)))

(declare-fun b!447967 () Bool)

(declare-fun res!266152 () Bool)

(assert (=> b!447967 (=> (not res!266152) (not e!262940))))

(assert (=> b!447967 (= res!266152 (and (= (size!13653 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13652 _keys!709) (size!13653 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447968 () Bool)

(declare-fun res!266154 () Bool)

(assert (=> b!447968 (=> (not res!266154) (not e!262940))))

(declare-datatypes ((List!7960 0))(
  ( (Nil!7957) (Cons!7956 (h!8812 (_ BitVec 64)) (t!13722 List!7960)) )
))
(declare-fun arrayNoDuplicates!0 (array!27709 (_ BitVec 32) List!7960) Bool)

(assert (=> b!447968 (= res!266154 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7957))))

(declare-fun b!447969 () Bool)

(declare-fun e!262937 () Bool)

(assert (=> b!447969 (= e!262937 tp_is_empty!11951)))

(declare-fun mapNonEmpty!19560 () Bool)

(declare-fun tp!37658 () Bool)

(assert (=> mapNonEmpty!19560 (= mapRes!19560 (and tp!37658 e!262939))))

(declare-fun mapKey!19560 () (_ BitVec 32))

(declare-fun mapValue!19560 () ValueCell!5632)

(declare-fun mapRest!19560 () (Array (_ BitVec 32) ValueCell!5632))

(assert (=> mapNonEmpty!19560 (= (arr!13301 _values!549) (store mapRest!19560 mapKey!19560 mapValue!19560))))

(declare-fun b!447970 () Bool)

(declare-fun res!266158 () Bool)

(assert (=> b!447970 (=> (not res!266158) (not e!262936))))

(assert (=> b!447970 (= res!266158 (arrayNoDuplicates!0 lt!204072 #b00000000000000000000000000000000 Nil!7957))))

(declare-fun b!447971 () Bool)

(declare-fun res!266163 () Bool)

(assert (=> b!447971 (=> (not res!266163) (not e!262940))))

(declare-fun arrayContainsKey!0 (array!27709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447971 (= res!266163 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!447972 () Bool)

(declare-fun res!266157 () Bool)

(assert (=> b!447972 (=> (not res!266157) (not e!262936))))

(assert (=> b!447972 (= res!266157 (bvsle from!863 i!563))))

(declare-fun b!447973 () Bool)

(declare-fun res!266156 () Bool)

(assert (=> b!447973 (=> (not res!266156) (not e!262940))))

(assert (=> b!447973 (= res!266156 (or (= (select (arr!13300 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13300 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447974 () Bool)

(declare-fun res!266159 () Bool)

(assert (=> b!447974 (=> (not res!266159) (not e!262940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447974 (= res!266159 (validMask!0 mask!1025))))

(declare-fun res!266162 () Bool)

(assert (=> start!40602 (=> (not res!266162) (not e!262940))))

(assert (=> start!40602 (= res!266162 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13652 _keys!709))))))

(assert (=> start!40602 e!262940))

(assert (=> start!40602 tp_is_empty!11951))

(assert (=> start!40602 tp!37659))

(assert (=> start!40602 true))

(declare-fun e!262935 () Bool)

(declare-fun array_inv!9638 (array!27711) Bool)

(assert (=> start!40602 (and (array_inv!9638 _values!549) e!262935)))

(declare-fun array_inv!9639 (array!27709) Bool)

(assert (=> start!40602 (array_inv!9639 _keys!709)))

(declare-fun b!447964 () Bool)

(declare-fun res!266153 () Bool)

(assert (=> b!447964 (=> (not res!266153) (not e!262940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447964 (= res!266153 (validKeyInArray!0 k!794))))

(declare-fun b!447975 () Bool)

(declare-fun res!266155 () Bool)

(assert (=> b!447975 (=> (not res!266155) (not e!262940))))

(assert (=> b!447975 (= res!266155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447976 () Bool)

(assert (=> b!447976 (= e!262935 (and e!262937 mapRes!19560))))

(declare-fun condMapEmpty!19560 () Bool)

(declare-fun mapDefault!19560 () ValueCell!5632)


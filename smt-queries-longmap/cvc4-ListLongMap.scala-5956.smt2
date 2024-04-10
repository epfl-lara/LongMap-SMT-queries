; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77566 () Bool)

(assert start!77566)

(declare-fun b_free!16151 () Bool)

(declare-fun b_next!16151 () Bool)

(assert (=> start!77566 (= b_free!16151 (not b_next!16151))))

(declare-fun tp!56715 () Bool)

(declare-fun b_and!26517 () Bool)

(assert (=> start!77566 (= tp!56715 b_and!26517)))

(declare-fun b!903759 () Bool)

(declare-fun e!506399 () Bool)

(declare-fun tp_is_empty!18569 () Bool)

(assert (=> b!903759 (= e!506399 tp_is_empty!18569)))

(declare-fun b!903760 () Bool)

(declare-fun res!609748 () Bool)

(declare-fun e!506401 () Bool)

(assert (=> b!903760 (=> (not res!609748) (not e!506401))))

(declare-datatypes ((V!29723 0))(
  ( (V!29724 (val!9335 Int)) )
))
(declare-datatypes ((ValueCell!8803 0))(
  ( (ValueCellFull!8803 (v!11840 V!29723)) (EmptyCell!8803) )
))
(declare-datatypes ((array!53190 0))(
  ( (array!53191 (arr!25554 (Array (_ BitVec 32) ValueCell!8803)) (size!26013 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53190)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29723)

(declare-datatypes ((array!53192 0))(
  ( (array!53193 (arr!25555 (Array (_ BitVec 32) (_ BitVec 64))) (size!26014 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53192)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29723)

(declare-datatypes ((tuple2!12124 0))(
  ( (tuple2!12125 (_1!6073 (_ BitVec 64)) (_2!6073 V!29723)) )
))
(declare-datatypes ((List!17943 0))(
  ( (Nil!17940) (Cons!17939 (h!19085 tuple2!12124) (t!25326 List!17943)) )
))
(declare-datatypes ((ListLongMap!10821 0))(
  ( (ListLongMap!10822 (toList!5426 List!17943)) )
))
(declare-fun contains!4474 (ListLongMap!10821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2695 (array!53192 array!53190 (_ BitVec 32) (_ BitVec 32) V!29723 V!29723 (_ BitVec 32) Int) ListLongMap!10821)

(assert (=> b!903760 (= res!609748 (contains!4474 (getCurrentListMap!2695 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903761 () Bool)

(declare-fun res!609746 () Bool)

(assert (=> b!903761 (=> (not res!609746) (not e!506401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53192 (_ BitVec 32)) Bool)

(assert (=> b!903761 (= res!609746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903762 () Bool)

(declare-fun res!609744 () Bool)

(assert (=> b!903762 (=> (not res!609744) (not e!506401))))

(assert (=> b!903762 (= res!609744 (and (= (size!26013 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26014 _keys!1386) (size!26013 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903763 () Bool)

(declare-fun e!506403 () Bool)

(assert (=> b!903763 (= e!506401 (not e!506403))))

(declare-fun res!609743 () Bool)

(assert (=> b!903763 (=> res!609743 e!506403)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!903763 (= res!609743 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26014 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903763 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30650 0))(
  ( (Unit!30651) )
))
(declare-fun lt!408065 () Unit!30650)

(declare-fun lemmaKeyInListMapIsInArray!168 (array!53192 array!53190 (_ BitVec 32) (_ BitVec 32) V!29723 V!29723 (_ BitVec 64) Int) Unit!30650)

(assert (=> b!903763 (= lt!408065 (lemmaKeyInListMapIsInArray!168 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!903764 () Bool)

(declare-fun res!609745 () Bool)

(assert (=> b!903764 (=> (not res!609745) (not e!506401))))

(declare-datatypes ((List!17944 0))(
  ( (Nil!17941) (Cons!17940 (h!19086 (_ BitVec 64)) (t!25327 List!17944)) )
))
(declare-fun arrayNoDuplicates!0 (array!53192 (_ BitVec 32) List!17944) Bool)

(assert (=> b!903764 (= res!609745 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17941))))

(declare-fun mapIsEmpty!29566 () Bool)

(declare-fun mapRes!29566 () Bool)

(assert (=> mapIsEmpty!29566 mapRes!29566))

(declare-fun b!903765 () Bool)

(declare-fun e!506397 () Bool)

(assert (=> b!903765 (= e!506397 tp_is_empty!18569)))

(declare-fun res!609749 () Bool)

(assert (=> start!77566 (=> (not res!609749) (not e!506401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77566 (= res!609749 (validMask!0 mask!1756))))

(assert (=> start!77566 e!506401))

(declare-fun e!506400 () Bool)

(declare-fun array_inv!20022 (array!53190) Bool)

(assert (=> start!77566 (and (array_inv!20022 _values!1152) e!506400)))

(assert (=> start!77566 tp!56715))

(assert (=> start!77566 true))

(assert (=> start!77566 tp_is_empty!18569))

(declare-fun array_inv!20023 (array!53192) Bool)

(assert (=> start!77566 (array_inv!20023 _keys!1386)))

(declare-fun b!903766 () Bool)

(declare-fun e!506398 () Bool)

(assert (=> b!903766 (= e!506398 true)))

(declare-fun lt!408064 () V!29723)

(declare-fun lt!408066 () ListLongMap!10821)

(declare-fun apply!424 (ListLongMap!10821 (_ BitVec 64)) V!29723)

(assert (=> b!903766 (= lt!408064 (apply!424 lt!408066 k!1033))))

(declare-fun b!903767 () Bool)

(assert (=> b!903767 (= e!506403 e!506398)))

(declare-fun res!609741 () Bool)

(assert (=> b!903767 (=> res!609741 e!506398)))

(assert (=> b!903767 (= res!609741 (not (contains!4474 lt!408066 k!1033)))))

(assert (=> b!903767 (= lt!408066 (getCurrentListMap!2695 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!903768 () Bool)

(declare-fun res!609747 () Bool)

(assert (=> b!903768 (=> (not res!609747) (not e!506401))))

(assert (=> b!903768 (= res!609747 (and (= (select (arr!25555 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903769 () Bool)

(assert (=> b!903769 (= e!506400 (and e!506399 mapRes!29566))))

(declare-fun condMapEmpty!29566 () Bool)

(declare-fun mapDefault!29566 () ValueCell!8803)


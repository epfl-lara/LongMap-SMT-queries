; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20920 () Bool)

(assert start!20920)

(declare-fun b_free!5533 () Bool)

(declare-fun b_next!5533 () Bool)

(assert (=> start!20920 (= b_free!5533 (not b_next!5533))))

(declare-fun tp!19646 () Bool)

(declare-fun b_and!12303 () Bool)

(assert (=> start!20920 (= tp!19646 b_and!12303)))

(declare-fun mapIsEmpty!9167 () Bool)

(declare-fun mapRes!9167 () Bool)

(assert (=> mapIsEmpty!9167 mapRes!9167))

(declare-datatypes ((V!6841 0))(
  ( (V!6842 (val!2742 Int)) )
))
(declare-datatypes ((tuple2!4144 0))(
  ( (tuple2!4145 (_1!2083 (_ BitVec 64)) (_2!2083 V!6841)) )
))
(declare-fun lt!107500 () tuple2!4144)

(declare-datatypes ((List!3039 0))(
  ( (Nil!3036) (Cons!3035 (h!3677 tuple2!4144) (t!7974 List!3039)) )
))
(declare-datatypes ((ListLongMap!3057 0))(
  ( (ListLongMap!3058 (toList!1544 List!3039)) )
))
(declare-fun lt!107498 () ListLongMap!3057)

(declare-fun lt!107492 () tuple2!4144)

(declare-fun e!136817 () Bool)

(declare-fun b!210063 () Bool)

(declare-fun lt!107494 () ListLongMap!3057)

(declare-fun +!547 (ListLongMap!3057 tuple2!4144) ListLongMap!3057)

(assert (=> b!210063 (= e!136817 (= lt!107498 (+!547 (+!547 lt!107494 lt!107500) lt!107492)))))

(declare-fun b!210064 () Bool)

(declare-fun res!102436 () Bool)

(declare-fun e!136821 () Bool)

(assert (=> b!210064 (=> (not res!102436) (not e!136821))))

(declare-datatypes ((array!9989 0))(
  ( (array!9990 (arr!4743 (Array (_ BitVec 32) (_ BitVec 64))) (size!5068 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9989)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210064 (= res!102436 (= (select (arr!4743 _keys!825) i!601) k!843))))

(declare-fun b!210065 () Bool)

(declare-fun res!102439 () Bool)

(assert (=> b!210065 (=> (not res!102439) (not e!136821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210065 (= res!102439 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!9167 () Bool)

(declare-fun tp!19645 () Bool)

(declare-fun e!136816 () Bool)

(assert (=> mapNonEmpty!9167 (= mapRes!9167 (and tp!19645 e!136816))))

(declare-fun mapKey!9167 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2354 0))(
  ( (ValueCellFull!2354 (v!4720 V!6841)) (EmptyCell!2354) )
))
(declare-datatypes ((array!9991 0))(
  ( (array!9992 (arr!4744 (Array (_ BitVec 32) ValueCell!2354)) (size!5069 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9991)

(declare-fun mapRest!9167 () (Array (_ BitVec 32) ValueCell!2354))

(declare-fun mapValue!9167 () ValueCell!2354)

(assert (=> mapNonEmpty!9167 (= (arr!4744 _values!649) (store mapRest!9167 mapKey!9167 mapValue!9167))))

(declare-fun lt!107497 () ListLongMap!3057)

(declare-fun e!136815 () Bool)

(declare-fun lt!107495 () ListLongMap!3057)

(declare-fun b!210066 () Bool)

(assert (=> b!210066 (= e!136815 (= lt!107497 (+!547 (+!547 lt!107495 lt!107500) lt!107492)))))

(assert (=> b!210066 e!136817))

(declare-fun res!102438 () Bool)

(assert (=> b!210066 (=> (not res!102438) (not e!136817))))

(declare-fun lt!107496 () ListLongMap!3057)

(assert (=> b!210066 (= res!102438 (= lt!107497 (+!547 (+!547 lt!107496 lt!107500) lt!107492)))))

(declare-fun minValue!615 () V!6841)

(assert (=> b!210066 (= lt!107492 (tuple2!4145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6841)

(assert (=> b!210066 (= lt!107500 (tuple2!4145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210067 () Bool)

(declare-fun res!102437 () Bool)

(assert (=> b!210067 (=> (not res!102437) (not e!136821))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9989 (_ BitVec 32)) Bool)

(assert (=> b!210067 (= res!102437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210068 () Bool)

(declare-fun res!102442 () Bool)

(assert (=> b!210068 (=> (not res!102442) (not e!136821))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210068 (= res!102442 (and (= (size!5069 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5068 _keys!825) (size!5069 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210069 () Bool)

(declare-fun e!136818 () Bool)

(declare-fun e!136820 () Bool)

(assert (=> b!210069 (= e!136818 (and e!136820 mapRes!9167))))

(declare-fun condMapEmpty!9167 () Bool)

(declare-fun mapDefault!9167 () ValueCell!2354)


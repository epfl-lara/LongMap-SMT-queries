; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21114 () Bool)

(assert start!21114)

(declare-fun b_free!5605 () Bool)

(declare-fun b_next!5605 () Bool)

(assert (=> start!21114 (= b_free!5605 (not b_next!5605))))

(declare-fun tp!19879 () Bool)

(declare-fun b_and!12447 () Bool)

(assert (=> start!21114 (= tp!19879 b_and!12447)))

(declare-fun res!103890 () Bool)

(declare-fun e!138249 () Bool)

(assert (=> start!21114 (=> (not res!103890) (not e!138249))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21114 (= res!103890 (validMask!0 mask!1149))))

(assert (=> start!21114 e!138249))

(declare-datatypes ((V!6937 0))(
  ( (V!6938 (val!2778 Int)) )
))
(declare-datatypes ((ValueCell!2390 0))(
  ( (ValueCellFull!2390 (v!4780 V!6937)) (EmptyCell!2390) )
))
(declare-datatypes ((array!10139 0))(
  ( (array!10140 (arr!4812 (Array (_ BitVec 32) ValueCell!2390)) (size!5137 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10139)

(declare-fun e!138252 () Bool)

(declare-fun array_inv!3185 (array!10139) Bool)

(assert (=> start!21114 (and (array_inv!3185 _values!649) e!138252)))

(assert (=> start!21114 true))

(declare-fun tp_is_empty!5467 () Bool)

(assert (=> start!21114 tp_is_empty!5467))

(declare-datatypes ((array!10141 0))(
  ( (array!10142 (arr!4813 (Array (_ BitVec 32) (_ BitVec 64))) (size!5138 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10141)

(declare-fun array_inv!3186 (array!10141) Bool)

(assert (=> start!21114 (array_inv!3186 _keys!825)))

(assert (=> start!21114 tp!19879))

(declare-fun b!212482 () Bool)

(declare-fun e!138251 () Bool)

(assert (=> b!212482 (= e!138251 tp_is_empty!5467)))

(declare-fun mapNonEmpty!9293 () Bool)

(declare-fun mapRes!9293 () Bool)

(declare-fun tp!19880 () Bool)

(assert (=> mapNonEmpty!9293 (= mapRes!9293 (and tp!19880 e!138251))))

(declare-fun mapValue!9293 () ValueCell!2390)

(declare-fun mapRest!9293 () (Array (_ BitVec 32) ValueCell!2390))

(declare-fun mapKey!9293 () (_ BitVec 32))

(assert (=> mapNonEmpty!9293 (= (arr!4812 _values!649) (store mapRest!9293 mapKey!9293 mapValue!9293))))

(declare-fun b!212483 () Bool)

(declare-fun res!103885 () Bool)

(assert (=> b!212483 (=> (not res!103885) (not e!138249))))

(declare-datatypes ((List!3095 0))(
  ( (Nil!3092) (Cons!3091 (h!3733 (_ BitVec 64)) (t!8042 List!3095)) )
))
(declare-fun arrayNoDuplicates!0 (array!10141 (_ BitVec 32) List!3095) Bool)

(assert (=> b!212483 (= res!103885 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3092))))

(declare-fun b!212484 () Bool)

(declare-fun res!103891 () Bool)

(assert (=> b!212484 (=> (not res!103891) (not e!138249))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212484 (= res!103891 (validKeyInArray!0 k!843))))

(declare-fun b!212485 () Bool)

(declare-fun res!103887 () Bool)

(assert (=> b!212485 (=> (not res!103887) (not e!138249))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212485 (= res!103887 (and (= (size!5137 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5138 _keys!825) (size!5137 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9293 () Bool)

(assert (=> mapIsEmpty!9293 mapRes!9293))

(declare-datatypes ((tuple2!4206 0))(
  ( (tuple2!4207 (_1!2114 (_ BitVec 64)) (_2!2114 V!6937)) )
))
(declare-fun lt!109538 () tuple2!4206)

(declare-fun e!138254 () Bool)

(declare-fun b!212486 () Bool)

(declare-datatypes ((List!3096 0))(
  ( (Nil!3093) (Cons!3092 (h!3734 tuple2!4206) (t!8043 List!3096)) )
))
(declare-datatypes ((ListLongMap!3119 0))(
  ( (ListLongMap!3120 (toList!1575 List!3096)) )
))
(declare-fun lt!109545 () ListLongMap!3119)

(declare-fun lt!109543 () ListLongMap!3119)

(declare-fun +!578 (ListLongMap!3119 tuple2!4206) ListLongMap!3119)

(assert (=> b!212486 (= e!138254 (= lt!109543 (+!578 lt!109545 lt!109538)))))

(declare-fun lt!109540 () ListLongMap!3119)

(assert (=> b!212486 (= lt!109543 (+!578 lt!109540 lt!109538))))

(declare-fun minValue!615 () V!6937)

(assert (=> b!212486 (= lt!109538 (tuple2!4207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!212487 () Bool)

(declare-fun e!138253 () Bool)

(assert (=> b!212487 (= e!138252 (and e!138253 mapRes!9293))))

(declare-fun condMapEmpty!9293 () Bool)

(declare-fun mapDefault!9293 () ValueCell!2390)


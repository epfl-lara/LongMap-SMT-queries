; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20406 () Bool)

(assert start!20406)

(declare-fun b_free!5065 () Bool)

(declare-fun b_next!5065 () Bool)

(assert (=> start!20406 (= b_free!5065 (not b_next!5065))))

(declare-fun tp!18227 () Bool)

(declare-fun b_and!11811 () Bool)

(assert (=> start!20406 (= tp!18227 b_and!11811)))

(declare-fun b!201798 () Bool)

(declare-fun e!132230 () Bool)

(declare-fun tp_is_empty!4921 () Bool)

(assert (=> b!201798 (= e!132230 tp_is_empty!4921)))

(declare-fun b!201799 () Bool)

(declare-fun e!132231 () Bool)

(assert (=> b!201799 (= e!132231 true)))

(declare-datatypes ((V!6209 0))(
  ( (V!6210 (val!2505 Int)) )
))
(declare-datatypes ((tuple2!3796 0))(
  ( (tuple2!3797 (_1!1909 (_ BitVec 64)) (_2!1909 V!6209)) )
))
(declare-fun lt!100854 () tuple2!3796)

(declare-datatypes ((List!2707 0))(
  ( (Nil!2704) (Cons!2703 (h!3345 tuple2!3796) (t!7638 List!2707)) )
))
(declare-datatypes ((ListLongMap!2709 0))(
  ( (ListLongMap!2710 (toList!1370 List!2707)) )
))
(declare-fun lt!100848 () ListLongMap!2709)

(declare-fun lt!100853 () tuple2!3796)

(declare-fun lt!100855 () ListLongMap!2709)

(declare-fun +!397 (ListLongMap!2709 tuple2!3796) ListLongMap!2709)

(assert (=> b!201799 (= (+!397 lt!100848 lt!100854) (+!397 lt!100855 lt!100853))))

(declare-datatypes ((Unit!6094 0))(
  ( (Unit!6095) )
))
(declare-fun lt!100857 () Unit!6094)

(declare-fun minValue!615 () V!6209)

(declare-fun v!520 () V!6209)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!100852 () ListLongMap!2709)

(declare-fun addCommutativeForDiffKeys!118 (ListLongMap!2709 (_ BitVec 64) V!6209 (_ BitVec 64) V!6209) Unit!6094)

(assert (=> b!201799 (= lt!100857 (addCommutativeForDiffKeys!118 lt!100852 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201800 () Bool)

(declare-fun res!96528 () Bool)

(declare-fun e!132236 () Bool)

(assert (=> b!201800 (=> (not res!96528) (not e!132236))))

(declare-datatypes ((array!9071 0))(
  ( (array!9072 (arr!4286 (Array (_ BitVec 32) (_ BitVec 64))) (size!4611 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9071)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2117 0))(
  ( (ValueCellFull!2117 (v!4475 V!6209)) (EmptyCell!2117) )
))
(declare-datatypes ((array!9073 0))(
  ( (array!9074 (arr!4287 (Array (_ BitVec 32) ValueCell!2117)) (size!4612 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9073)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201800 (= res!96528 (and (= (size!4612 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4611 _keys!825) (size!4612 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201801 () Bool)

(declare-fun e!132232 () Bool)

(declare-fun e!132233 () Bool)

(declare-fun mapRes!8450 () Bool)

(assert (=> b!201801 (= e!132232 (and e!132233 mapRes!8450))))

(declare-fun condMapEmpty!8450 () Bool)

(declare-fun mapDefault!8450 () ValueCell!2117)


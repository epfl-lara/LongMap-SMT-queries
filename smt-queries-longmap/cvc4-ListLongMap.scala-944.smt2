; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20764 () Bool)

(assert start!20764)

(declare-fun b_free!5423 () Bool)

(declare-fun b_next!5423 () Bool)

(assert (=> start!20764 (= b_free!5423 (not b_next!5423))))

(declare-fun tp!19300 () Bool)

(declare-fun b_and!12169 () Bool)

(assert (=> start!20764 (= tp!19300 b_and!12169)))

(declare-fun b!207956 () Bool)

(declare-fun res!101068 () Bool)

(declare-fun e!135686 () Bool)

(assert (=> b!207956 (=> (not res!101068) (not e!135686))))

(declare-datatypes ((array!9763 0))(
  ( (array!9764 (arr!4632 (Array (_ BitVec 32) (_ BitVec 64))) (size!4957 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9763)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6685 0))(
  ( (V!6686 (val!2684 Int)) )
))
(declare-datatypes ((ValueCell!2296 0))(
  ( (ValueCellFull!2296 (v!4654 V!6685)) (EmptyCell!2296) )
))
(declare-datatypes ((array!9765 0))(
  ( (array!9766 (arr!4633 (Array (_ BitVec 32) ValueCell!2296)) (size!4958 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9765)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207956 (= res!101068 (and (= (size!4958 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4957 _keys!825) (size!4958 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207957 () Bool)

(declare-fun res!101072 () Bool)

(assert (=> b!207957 (=> (not res!101072) (not e!135686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9763 (_ BitVec 32)) Bool)

(assert (=> b!207957 (= res!101072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207958 () Bool)

(declare-fun e!135687 () Bool)

(declare-fun tp_is_empty!5279 () Bool)

(assert (=> b!207958 (= e!135687 tp_is_empty!5279)))

(declare-fun mapNonEmpty!8987 () Bool)

(declare-fun mapRes!8987 () Bool)

(declare-fun tp!19301 () Bool)

(assert (=> mapNonEmpty!8987 (= mapRes!8987 (and tp!19301 e!135687))))

(declare-fun mapKey!8987 () (_ BitVec 32))

(declare-fun mapRest!8987 () (Array (_ BitVec 32) ValueCell!2296))

(declare-fun mapValue!8987 () ValueCell!2296)

(assert (=> mapNonEmpty!8987 (= (arr!4633 _values!649) (store mapRest!8987 mapKey!8987 mapValue!8987))))

(declare-fun mapIsEmpty!8987 () Bool)

(assert (=> mapIsEmpty!8987 mapRes!8987))

(declare-fun res!101074 () Bool)

(assert (=> start!20764 (=> (not res!101074) (not e!135686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20764 (= res!101074 (validMask!0 mask!1149))))

(assert (=> start!20764 e!135686))

(declare-fun e!135685 () Bool)

(declare-fun array_inv!3069 (array!9765) Bool)

(assert (=> start!20764 (and (array_inv!3069 _values!649) e!135685)))

(assert (=> start!20764 true))

(assert (=> start!20764 tp_is_empty!5279))

(declare-fun array_inv!3070 (array!9763) Bool)

(assert (=> start!20764 (array_inv!3070 _keys!825)))

(assert (=> start!20764 tp!19300))

(declare-fun b!207959 () Bool)

(declare-fun e!135688 () Bool)

(assert (=> b!207959 (= e!135685 (and e!135688 mapRes!8987))))

(declare-fun condMapEmpty!8987 () Bool)

(declare-fun mapDefault!8987 () ValueCell!2296)


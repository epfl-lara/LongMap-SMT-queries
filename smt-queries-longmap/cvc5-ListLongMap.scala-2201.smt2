; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36578 () Bool)

(assert start!36578)

(declare-fun b!365280 () Bool)

(declare-fun e!223650 () Bool)

(declare-datatypes ((array!20843 0))(
  ( (array!20844 (arr!9897 (Array (_ BitVec 32) (_ BitVec 64))) (size!10249 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20843)

(assert (=> b!365280 (= e!223650 (and (bvsle #b00000000000000000000000000000000 (size!10249 _keys!658)) (bvsge (size!10249 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365281 () Bool)

(declare-fun e!223653 () Bool)

(declare-fun tp_is_empty!8443 () Bool)

(assert (=> b!365281 (= e!223653 tp_is_empty!8443)))

(declare-fun b!365282 () Bool)

(declare-fun res!204237 () Bool)

(assert (=> b!365282 (=> (not res!204237) (not e!223650))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20843 (_ BitVec 32)) Bool)

(assert (=> b!365282 (= res!204237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14208 () Bool)

(declare-fun mapRes!14208 () Bool)

(declare-fun tp!28284 () Bool)

(assert (=> mapNonEmpty!14208 (= mapRes!14208 (and tp!28284 e!223653))))

(declare-datatypes ((V!12363 0))(
  ( (V!12364 (val!4266 Int)) )
))
(declare-datatypes ((ValueCell!3878 0))(
  ( (ValueCellFull!3878 (v!6461 V!12363)) (EmptyCell!3878) )
))
(declare-datatypes ((array!20845 0))(
  ( (array!20846 (arr!9898 (Array (_ BitVec 32) ValueCell!3878)) (size!10250 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20845)

(declare-fun mapValue!14208 () ValueCell!3878)

(declare-fun mapRest!14208 () (Array (_ BitVec 32) ValueCell!3878))

(declare-fun mapKey!14208 () (_ BitVec 32))

(assert (=> mapNonEmpty!14208 (= (arr!9898 _values!506) (store mapRest!14208 mapKey!14208 mapValue!14208))))

(declare-fun mapIsEmpty!14208 () Bool)

(assert (=> mapIsEmpty!14208 mapRes!14208))

(declare-fun b!365283 () Bool)

(declare-fun res!204238 () Bool)

(assert (=> b!365283 (=> (not res!204238) (not e!223650))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365283 (= res!204238 (and (= (size!10250 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10249 _keys!658) (size!10250 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365284 () Bool)

(declare-fun e!223652 () Bool)

(assert (=> b!365284 (= e!223652 tp_is_empty!8443)))

(declare-fun b!365285 () Bool)

(declare-fun e!223654 () Bool)

(assert (=> b!365285 (= e!223654 (and e!223652 mapRes!14208))))

(declare-fun condMapEmpty!14208 () Bool)

(declare-fun mapDefault!14208 () ValueCell!3878)


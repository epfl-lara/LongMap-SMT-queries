; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36546 () Bool)

(assert start!36546)

(declare-fun res!204181 () Bool)

(declare-fun e!223495 () Bool)

(assert (=> start!36546 (=> (not res!204181) (not e!223495))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36546 (= res!204181 (validMask!0 mask!970))))

(assert (=> start!36546 e!223495))

(assert (=> start!36546 true))

(declare-datatypes ((V!12339 0))(
  ( (V!12340 (val!4257 Int)) )
))
(declare-datatypes ((ValueCell!3869 0))(
  ( (ValueCellFull!3869 (v!6452 V!12339)) (EmptyCell!3869) )
))
(declare-datatypes ((array!20805 0))(
  ( (array!20806 (arr!9880 (Array (_ BitVec 32) ValueCell!3869)) (size!10232 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20805)

(declare-fun e!223498 () Bool)

(declare-fun array_inv!7322 (array!20805) Bool)

(assert (=> start!36546 (and (array_inv!7322 _values!506) e!223498)))

(declare-datatypes ((array!20807 0))(
  ( (array!20808 (arr!9881 (Array (_ BitVec 32) (_ BitVec 64))) (size!10233 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20807)

(declare-fun array_inv!7323 (array!20807) Bool)

(assert (=> start!36546 (array_inv!7323 _keys!658)))

(declare-fun b!365122 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365122 (= e!223495 (and (= (size!10232 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10233 _keys!658) (size!10232 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (not (= (size!10233 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)))))))

(declare-fun mapNonEmpty!14175 () Bool)

(declare-fun mapRes!14175 () Bool)

(declare-fun tp!28251 () Bool)

(declare-fun e!223496 () Bool)

(assert (=> mapNonEmpty!14175 (= mapRes!14175 (and tp!28251 e!223496))))

(declare-fun mapRest!14175 () (Array (_ BitVec 32) ValueCell!3869))

(declare-fun mapValue!14175 () ValueCell!3869)

(declare-fun mapKey!14175 () (_ BitVec 32))

(assert (=> mapNonEmpty!14175 (= (arr!9880 _values!506) (store mapRest!14175 mapKey!14175 mapValue!14175))))

(declare-fun b!365123 () Bool)

(declare-fun e!223494 () Bool)

(declare-fun tp_is_empty!8425 () Bool)

(assert (=> b!365123 (= e!223494 tp_is_empty!8425)))

(declare-fun mapIsEmpty!14175 () Bool)

(assert (=> mapIsEmpty!14175 mapRes!14175))

(declare-fun b!365124 () Bool)

(assert (=> b!365124 (= e!223496 tp_is_empty!8425)))

(declare-fun b!365125 () Bool)

(assert (=> b!365125 (= e!223498 (and e!223494 mapRes!14175))))

(declare-fun condMapEmpty!14175 () Bool)

(declare-fun mapDefault!14175 () ValueCell!3869)


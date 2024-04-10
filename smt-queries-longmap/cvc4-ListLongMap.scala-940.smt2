; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20740 () Bool)

(assert start!20740)

(declare-fun b_free!5399 () Bool)

(declare-fun b_next!5399 () Bool)

(assert (=> start!20740 (= b_free!5399 (not b_next!5399))))

(declare-fun tp!19228 () Bool)

(declare-fun b_and!12145 () Bool)

(assert (=> start!20740 (= tp!19228 b_and!12145)))

(declare-fun mapNonEmpty!8951 () Bool)

(declare-fun mapRes!8951 () Bool)

(declare-fun tp!19229 () Bool)

(declare-fun e!135508 () Bool)

(assert (=> mapNonEmpty!8951 (= mapRes!8951 (and tp!19229 e!135508))))

(declare-datatypes ((V!6653 0))(
  ( (V!6654 (val!2672 Int)) )
))
(declare-datatypes ((ValueCell!2284 0))(
  ( (ValueCellFull!2284 (v!4642 V!6653)) (EmptyCell!2284) )
))
(declare-fun mapValue!8951 () ValueCell!2284)

(declare-datatypes ((array!9717 0))(
  ( (array!9718 (arr!4609 (Array (_ BitVec 32) ValueCell!2284)) (size!4934 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9717)

(declare-fun mapRest!8951 () (Array (_ BitVec 32) ValueCell!2284))

(declare-fun mapKey!8951 () (_ BitVec 32))

(assert (=> mapNonEmpty!8951 (= (arr!4609 _values!649) (store mapRest!8951 mapKey!8951 mapValue!8951))))

(declare-fun b!207596 () Bool)

(declare-fun res!100817 () Bool)

(declare-fun e!135509 () Bool)

(assert (=> b!207596 (=> (not res!100817) (not e!135509))))

(declare-datatypes ((array!9719 0))(
  ( (array!9720 (arr!4610 (Array (_ BitVec 32) (_ BitVec 64))) (size!4935 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9719)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207596 (= res!100817 (and (= (size!4934 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4935 _keys!825) (size!4934 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100818 () Bool)

(assert (=> start!20740 (=> (not res!100818) (not e!135509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20740 (= res!100818 (validMask!0 mask!1149))))

(assert (=> start!20740 e!135509))

(declare-fun e!135506 () Bool)

(declare-fun array_inv!3055 (array!9717) Bool)

(assert (=> start!20740 (and (array_inv!3055 _values!649) e!135506)))

(assert (=> start!20740 true))

(declare-fun tp_is_empty!5255 () Bool)

(assert (=> start!20740 tp_is_empty!5255))

(declare-fun array_inv!3056 (array!9719) Bool)

(assert (=> start!20740 (array_inv!3056 _keys!825)))

(assert (=> start!20740 tp!19228))

(declare-fun b!207597 () Bool)

(declare-fun res!100816 () Bool)

(assert (=> b!207597 (=> (not res!100816) (not e!135509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9719 (_ BitVec 32)) Bool)

(assert (=> b!207597 (= res!100816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207598 () Bool)

(assert (=> b!207598 (= e!135508 tp_is_empty!5255)))

(declare-fun b!207599 () Bool)

(declare-fun res!100822 () Bool)

(assert (=> b!207599 (=> (not res!100822) (not e!135509))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207599 (= res!100822 (= (select (arr!4610 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!8951 () Bool)

(assert (=> mapIsEmpty!8951 mapRes!8951))

(declare-fun b!207600 () Bool)

(declare-fun res!100820 () Bool)

(assert (=> b!207600 (=> (not res!100820) (not e!135509))))

(assert (=> b!207600 (= res!100820 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4935 _keys!825))))))

(declare-fun b!207601 () Bool)

(declare-fun e!135505 () Bool)

(assert (=> b!207601 (= e!135505 tp_is_empty!5255)))

(declare-fun b!207602 () Bool)

(declare-fun res!100819 () Bool)

(assert (=> b!207602 (=> (not res!100819) (not e!135509))))

(declare-datatypes ((List!2948 0))(
  ( (Nil!2945) (Cons!2944 (h!3586 (_ BitVec 64)) (t!7879 List!2948)) )
))
(declare-fun arrayNoDuplicates!0 (array!9719 (_ BitVec 32) List!2948) Bool)

(assert (=> b!207602 (= res!100819 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2945))))

(declare-fun b!207603 () Bool)

(declare-fun res!100821 () Bool)

(assert (=> b!207603 (=> (not res!100821) (not e!135509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207603 (= res!100821 (validKeyInArray!0 k!843))))

(declare-fun b!207604 () Bool)

(assert (=> b!207604 (= e!135506 (and e!135505 mapRes!8951))))

(declare-fun condMapEmpty!8951 () Bool)

(declare-fun mapDefault!8951 () ValueCell!2284)


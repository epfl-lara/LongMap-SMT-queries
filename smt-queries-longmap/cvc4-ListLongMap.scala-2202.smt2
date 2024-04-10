; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36596 () Bool)

(assert start!36596)

(declare-fun b!365398 () Bool)

(declare-fun res!204296 () Bool)

(declare-fun e!223741 () Bool)

(assert (=> b!365398 (=> (not res!204296) (not e!223741))))

(declare-datatypes ((array!20863 0))(
  ( (array!20864 (arr!9906 (Array (_ BitVec 32) (_ BitVec 64))) (size!10258 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20863)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20863 (_ BitVec 32)) Bool)

(assert (=> b!365398 (= res!204296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365399 () Bool)

(declare-fun e!223742 () Bool)

(declare-fun tp_is_empty!8453 () Bool)

(assert (=> b!365399 (= e!223742 tp_is_empty!8453)))

(declare-fun mapNonEmpty!14226 () Bool)

(declare-fun mapRes!14226 () Bool)

(declare-fun tp!28302 () Bool)

(assert (=> mapNonEmpty!14226 (= mapRes!14226 (and tp!28302 e!223742))))

(declare-fun mapKey!14226 () (_ BitVec 32))

(declare-datatypes ((V!12375 0))(
  ( (V!12376 (val!4271 Int)) )
))
(declare-datatypes ((ValueCell!3883 0))(
  ( (ValueCellFull!3883 (v!6466 V!12375)) (EmptyCell!3883) )
))
(declare-fun mapValue!14226 () ValueCell!3883)

(declare-datatypes ((array!20865 0))(
  ( (array!20866 (arr!9907 (Array (_ BitVec 32) ValueCell!3883)) (size!10259 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20865)

(declare-fun mapRest!14226 () (Array (_ BitVec 32) ValueCell!3883))

(assert (=> mapNonEmpty!14226 (= (arr!9907 _values!506) (store mapRest!14226 mapKey!14226 mapValue!14226))))

(declare-fun b!365400 () Bool)

(declare-fun e!223740 () Bool)

(assert (=> b!365400 (= e!223740 tp_is_empty!8453)))

(declare-fun b!365401 () Bool)

(declare-fun res!204298 () Bool)

(assert (=> b!365401 (=> (not res!204298) (not e!223741))))

(assert (=> b!365401 (= res!204298 (and (bvsle #b00000000000000000000000000000000 (size!10258 _keys!658)) (bvslt (size!10258 _keys!658) #b01111111111111111111111111111111)))))

(declare-fun b!365402 () Bool)

(declare-fun res!204295 () Bool)

(assert (=> b!365402 (=> (not res!204295) (not e!223741))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365402 (= res!204295 (and (= (size!10259 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10258 _keys!658) (size!10259 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365403 () Bool)

(declare-datatypes ((List!5525 0))(
  ( (Nil!5522) (Cons!5521 (h!6377 (_ BitVec 64)) (t!10675 List!5525)) )
))
(declare-fun noDuplicate!185 (List!5525) Bool)

(assert (=> b!365403 (= e!223741 (not (noDuplicate!185 Nil!5522)))))

(declare-fun res!204297 () Bool)

(assert (=> start!36596 (=> (not res!204297) (not e!223741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36596 (= res!204297 (validMask!0 mask!970))))

(assert (=> start!36596 e!223741))

(assert (=> start!36596 true))

(declare-fun e!223743 () Bool)

(declare-fun array_inv!7336 (array!20865) Bool)

(assert (=> start!36596 (and (array_inv!7336 _values!506) e!223743)))

(declare-fun array_inv!7337 (array!20863) Bool)

(assert (=> start!36596 (array_inv!7337 _keys!658)))

(declare-fun mapIsEmpty!14226 () Bool)

(assert (=> mapIsEmpty!14226 mapRes!14226))

(declare-fun b!365404 () Bool)

(assert (=> b!365404 (= e!223743 (and e!223740 mapRes!14226))))

(declare-fun condMapEmpty!14226 () Bool)

(declare-fun mapDefault!14226 () ValueCell!3883)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36788 () Bool)

(assert start!36788)

(declare-fun b!367398 () Bool)

(declare-fun res!205686 () Bool)

(declare-fun e!224847 () Bool)

(assert (=> b!367398 (=> (not res!205686) (not e!224847))))

(declare-datatypes ((array!21085 0))(
  ( (array!21086 (arr!10011 (Array (_ BitVec 32) (_ BitVec 64))) (size!10363 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21085)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367398 (= res!205686 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!367399 () Bool)

(declare-fun res!205692 () Bool)

(assert (=> b!367399 (=> (not res!205692) (not e!224847))))

(declare-datatypes ((List!5566 0))(
  ( (Nil!5563) (Cons!5562 (h!6418 (_ BitVec 64)) (t!10716 List!5566)) )
))
(declare-fun arrayNoDuplicates!0 (array!21085 (_ BitVec 32) List!5566) Bool)

(assert (=> b!367399 (= res!205692 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5563))))

(declare-fun mapNonEmpty!14409 () Bool)

(declare-fun mapRes!14409 () Bool)

(declare-fun tp!28485 () Bool)

(declare-fun e!224846 () Bool)

(assert (=> mapNonEmpty!14409 (= mapRes!14409 (and tp!28485 e!224846))))

(declare-datatypes ((V!12523 0))(
  ( (V!12524 (val!4326 Int)) )
))
(declare-datatypes ((ValueCell!3938 0))(
  ( (ValueCellFull!3938 (v!6523 V!12523)) (EmptyCell!3938) )
))
(declare-fun mapRest!14409 () (Array (_ BitVec 32) ValueCell!3938))

(declare-datatypes ((array!21087 0))(
  ( (array!21088 (arr!10012 (Array (_ BitVec 32) ValueCell!3938)) (size!10364 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21087)

(declare-fun mapValue!14409 () ValueCell!3938)

(declare-fun mapKey!14409 () (_ BitVec 32))

(assert (=> mapNonEmpty!14409 (= (arr!10012 _values!506) (store mapRest!14409 mapKey!14409 mapValue!14409))))

(declare-fun res!205690 () Bool)

(assert (=> start!36788 (=> (not res!205690) (not e!224847))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36788 (= res!205690 (validMask!0 mask!970))))

(assert (=> start!36788 e!224847))

(assert (=> start!36788 true))

(declare-fun e!224844 () Bool)

(declare-fun array_inv!7402 (array!21087) Bool)

(assert (=> start!36788 (and (array_inv!7402 _values!506) e!224844)))

(declare-fun array_inv!7403 (array!21085) Bool)

(assert (=> start!36788 (array_inv!7403 _keys!658)))

(declare-fun b!367400 () Bool)

(declare-fun e!224849 () Bool)

(assert (=> b!367400 (= e!224844 (and e!224849 mapRes!14409))))

(declare-fun condMapEmpty!14409 () Bool)

(declare-fun mapDefault!14409 () ValueCell!3938)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19966 () Bool)

(assert start!19966)

(declare-fun b!195791 () Bool)

(declare-fun res!92381 () Bool)

(declare-fun e!128865 () Bool)

(assert (=> b!195791 (=> (not res!92381) (not e!128865))))

(declare-datatypes ((array!8295 0))(
  ( (array!8296 (arr!3902 (Array (_ BitVec 32) (_ BitVec 64))) (size!4227 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8295)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5673 0))(
  ( (V!5674 (val!2304 Int)) )
))
(declare-datatypes ((ValueCell!1916 0))(
  ( (ValueCellFull!1916 (v!4273 V!5673)) (EmptyCell!1916) )
))
(declare-datatypes ((array!8297 0))(
  ( (array!8298 (arr!3903 (Array (_ BitVec 32) ValueCell!1916)) (size!4228 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8297)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!195791 (= res!92381 (and (= (size!4228 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4227 _keys!825) (size!4228 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195792 () Bool)

(declare-fun res!92379 () Bool)

(assert (=> b!195792 (=> (not res!92379) (not e!128865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8295 (_ BitVec 32)) Bool)

(assert (=> b!195792 (= res!92379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7835 () Bool)

(declare-fun mapRes!7835 () Bool)

(assert (=> mapIsEmpty!7835 mapRes!7835))

(declare-fun b!195793 () Bool)

(declare-fun e!128864 () Bool)

(declare-fun tp_is_empty!4519 () Bool)

(assert (=> b!195793 (= e!128864 tp_is_empty!4519)))

(declare-fun b!195794 () Bool)

(declare-fun e!128861 () Bool)

(assert (=> b!195794 (= e!128861 tp_is_empty!4519)))

(declare-fun b!195795 () Bool)

(assert (=> b!195795 (= e!128865 (bvsgt #b00000000000000000000000000000000 (size!4227 _keys!825)))))

(declare-fun mapNonEmpty!7835 () Bool)

(declare-fun tp!17123 () Bool)

(assert (=> mapNonEmpty!7835 (= mapRes!7835 (and tp!17123 e!128861))))

(declare-fun mapRest!7835 () (Array (_ BitVec 32) ValueCell!1916))

(declare-fun mapKey!7835 () (_ BitVec 32))

(declare-fun mapValue!7835 () ValueCell!1916)

(assert (=> mapNonEmpty!7835 (= (arr!3903 _values!649) (store mapRest!7835 mapKey!7835 mapValue!7835))))

(declare-fun res!92380 () Bool)

(assert (=> start!19966 (=> (not res!92380) (not e!128865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19966 (= res!92380 (validMask!0 mask!1149))))

(assert (=> start!19966 e!128865))

(assert (=> start!19966 true))

(declare-fun e!128863 () Bool)

(declare-fun array_inv!2535 (array!8297) Bool)

(assert (=> start!19966 (and (array_inv!2535 _values!649) e!128863)))

(declare-fun array_inv!2536 (array!8295) Bool)

(assert (=> start!19966 (array_inv!2536 _keys!825)))

(declare-fun b!195796 () Bool)

(assert (=> b!195796 (= e!128863 (and e!128864 mapRes!7835))))

(declare-fun condMapEmpty!7835 () Bool)

(declare-fun mapDefault!7835 () ValueCell!1916)


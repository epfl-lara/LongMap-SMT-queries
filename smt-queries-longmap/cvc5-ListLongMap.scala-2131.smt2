; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36036 () Bool)

(assert start!36036)

(declare-fun res!201314 () Bool)

(declare-fun e!221627 () Bool)

(assert (=> start!36036 (=> (not res!201314) (not e!221627))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36036 (= res!201314 (validMask!0 mask!1943))))

(assert (=> start!36036 e!221627))

(assert (=> start!36036 true))

(declare-datatypes ((array!20369 0))(
  ( (array!20370 (arr!9670 (Array (_ BitVec 32) (_ BitVec 64))) (size!10022 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20369)

(declare-fun array_inv!7114 (array!20369) Bool)

(assert (=> start!36036 (array_inv!7114 _keys!1541)))

(declare-datatypes ((V!12187 0))(
  ( (V!12188 (val!4248 Int)) )
))
(declare-datatypes ((ValueCell!3860 0))(
  ( (ValueCellFull!3860 (v!6443 V!12187)) (EmptyCell!3860) )
))
(declare-datatypes ((array!20371 0))(
  ( (array!20372 (arr!9671 (Array (_ BitVec 32) ValueCell!3860)) (size!10023 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20371)

(declare-fun e!221628 () Bool)

(declare-fun array_inv!7115 (array!20371) Bool)

(assert (=> start!36036 (and (array_inv!7115 _values!1277) e!221628)))

(declare-fun mapIsEmpty!14142 () Bool)

(declare-fun mapRes!14142 () Bool)

(assert (=> mapIsEmpty!14142 mapRes!14142))

(declare-fun b!361864 () Bool)

(declare-fun res!201316 () Bool)

(assert (=> b!361864 (=> (not res!201316) (not e!221627))))

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361864 (= res!201316 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10022 _keys!1541))))))

(declare-fun mapNonEmpty!14142 () Bool)

(declare-fun tp!28218 () Bool)

(declare-fun e!221629 () Bool)

(assert (=> mapNonEmpty!14142 (= mapRes!14142 (and tp!28218 e!221629))))

(declare-fun mapRest!14142 () (Array (_ BitVec 32) ValueCell!3860))

(declare-fun mapKey!14142 () (_ BitVec 32))

(declare-fun mapValue!14142 () ValueCell!3860)

(assert (=> mapNonEmpty!14142 (= (arr!9671 _values!1277) (store mapRest!14142 mapKey!14142 mapValue!14142))))

(declare-fun b!361865 () Bool)

(declare-fun res!201313 () Bool)

(assert (=> b!361865 (=> (not res!201313) (not e!221627))))

(declare-datatypes ((List!5517 0))(
  ( (Nil!5514) (Cons!5513 (h!6369 (_ BitVec 64)) (t!10667 List!5517)) )
))
(declare-fun arrayNoDuplicates!0 (array!20369 (_ BitVec 32) List!5517) Bool)

(assert (=> b!361865 (= res!201313 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5514))))

(declare-fun b!361866 () Bool)

(declare-fun e!221631 () Bool)

(assert (=> b!361866 (= e!221628 (and e!221631 mapRes!14142))))

(declare-fun condMapEmpty!14142 () Bool)

(declare-fun mapDefault!14142 () ValueCell!3860)


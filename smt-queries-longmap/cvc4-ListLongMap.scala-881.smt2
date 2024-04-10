; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20386 () Bool)

(assert start!20386)

(declare-fun b_free!5045 () Bool)

(declare-fun b_next!5045 () Bool)

(assert (=> start!20386 (= b_free!5045 (not b_next!5045))))

(declare-fun tp!18167 () Bool)

(declare-fun b_and!11791 () Bool)

(assert (=> start!20386 (= tp!18167 b_and!11791)))

(declare-fun b!201438 () Bool)

(declare-fun res!96259 () Bool)

(declare-fun e!132022 () Bool)

(assert (=> b!201438 (=> (not res!96259) (not e!132022))))

(declare-datatypes ((array!9031 0))(
  ( (array!9032 (arr!4266 (Array (_ BitVec 32) (_ BitVec 64))) (size!4591 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9031)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6181 0))(
  ( (V!6182 (val!2495 Int)) )
))
(declare-datatypes ((ValueCell!2107 0))(
  ( (ValueCellFull!2107 (v!4465 V!6181)) (EmptyCell!2107) )
))
(declare-datatypes ((array!9033 0))(
  ( (array!9034 (arr!4267 (Array (_ BitVec 32) ValueCell!2107)) (size!4592 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9033)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201438 (= res!96259 (and (= (size!4592 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4591 _keys!825) (size!4592 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!96256 () Bool)

(assert (=> start!20386 (=> (not res!96256) (not e!132022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20386 (= res!96256 (validMask!0 mask!1149))))

(assert (=> start!20386 e!132022))

(declare-fun e!132020 () Bool)

(declare-fun array_inv!2813 (array!9033) Bool)

(assert (=> start!20386 (and (array_inv!2813 _values!649) e!132020)))

(assert (=> start!20386 true))

(declare-fun tp_is_empty!4901 () Bool)

(assert (=> start!20386 tp_is_empty!4901))

(declare-fun array_inv!2814 (array!9031) Bool)

(assert (=> start!20386 (array_inv!2814 _keys!825)))

(assert (=> start!20386 tp!18167))

(declare-fun b!201439 () Bool)

(declare-fun e!132024 () Bool)

(declare-fun mapRes!8420 () Bool)

(assert (=> b!201439 (= e!132020 (and e!132024 mapRes!8420))))

(declare-fun condMapEmpty!8420 () Bool)

(declare-fun mapDefault!8420 () ValueCell!2107)


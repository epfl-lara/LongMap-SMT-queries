; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20068 () Bool)

(assert start!20068)

(declare-fun b!196503 () Bool)

(declare-fun e!129434 () Bool)

(assert (=> b!196503 (= e!129434 false)))

(declare-fun lt!97629 () Bool)

(declare-datatypes ((array!8423 0))(
  ( (array!8424 (arr!3962 (Array (_ BitVec 32) (_ BitVec 64))) (size!4287 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8423)

(declare-datatypes ((List!2476 0))(
  ( (Nil!2473) (Cons!2472 (h!3114 (_ BitVec 64)) (t!7407 List!2476)) )
))
(declare-fun arrayNoDuplicates!0 (array!8423 (_ BitVec 32) List!2476) Bool)

(assert (=> b!196503 (= lt!97629 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2473))))

(declare-fun res!92749 () Bool)

(assert (=> start!20068 (=> (not res!92749) (not e!129434))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20068 (= res!92749 (validMask!0 mask!1149))))

(assert (=> start!20068 e!129434))

(assert (=> start!20068 true))

(declare-datatypes ((V!5757 0))(
  ( (V!5758 (val!2336 Int)) )
))
(declare-datatypes ((ValueCell!1948 0))(
  ( (ValueCellFull!1948 (v!4306 V!5757)) (EmptyCell!1948) )
))
(declare-datatypes ((array!8425 0))(
  ( (array!8426 (arr!3963 (Array (_ BitVec 32) ValueCell!1948)) (size!4288 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8425)

(declare-fun e!129431 () Bool)

(declare-fun array_inv!2581 (array!8425) Bool)

(assert (=> start!20068 (and (array_inv!2581 _values!649) e!129431)))

(declare-fun array_inv!2582 (array!8423) Bool)

(assert (=> start!20068 (array_inv!2582 _keys!825)))

(declare-fun b!196504 () Bool)

(declare-fun res!92748 () Bool)

(assert (=> b!196504 (=> (not res!92748) (not e!129434))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196504 (= res!92748 (and (= (size!4288 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4287 _keys!825) (size!4288 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196505 () Bool)

(declare-fun e!129430 () Bool)

(declare-fun mapRes!7943 () Bool)

(assert (=> b!196505 (= e!129431 (and e!129430 mapRes!7943))))

(declare-fun condMapEmpty!7943 () Bool)

(declare-fun mapDefault!7943 () ValueCell!1948)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35996 () Bool)

(assert start!35996)

(declare-fun res!201131 () Bool)

(declare-fun e!221433 () Bool)

(assert (=> start!35996 (=> (not res!201131) (not e!221433))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35996 (= res!201131 (validMask!0 mask!1943))))

(assert (=> start!35996 e!221433))

(assert (=> start!35996 true))

(declare-datatypes ((array!20329 0))(
  ( (array!20330 (arr!9652 (Array (_ BitVec 32) (_ BitVec 64))) (size!10004 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20329)

(declare-fun array_inv!7098 (array!20329) Bool)

(assert (=> start!35996 (array_inv!7098 _keys!1541)))

(declare-datatypes ((V!12163 0))(
  ( (V!12164 (val!4239 Int)) )
))
(declare-datatypes ((ValueCell!3851 0))(
  ( (ValueCellFull!3851 (v!6434 V!12163)) (EmptyCell!3851) )
))
(declare-datatypes ((array!20331 0))(
  ( (array!20332 (arr!9653 (Array (_ BitVec 32) ValueCell!3851)) (size!10005 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20331)

(declare-fun e!221434 () Bool)

(declare-fun array_inv!7099 (array!20331) Bool)

(assert (=> start!35996 (and (array_inv!7099 _values!1277) e!221434)))

(declare-fun b!361559 () Bool)

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361559 (= e!221433 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10004 _keys!1541)) (bvsge (size!10004 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361560 () Bool)

(declare-fun res!201128 () Bool)

(assert (=> b!361560 (=> (not res!201128) (not e!221433))))

(declare-datatypes ((List!5510 0))(
  ( (Nil!5507) (Cons!5506 (h!6362 (_ BitVec 64)) (t!10660 List!5510)) )
))
(declare-fun arrayNoDuplicates!0 (array!20329 (_ BitVec 32) List!5510) Bool)

(assert (=> b!361560 (= res!201128 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5507))))

(declare-fun b!361561 () Bool)

(declare-fun res!201130 () Bool)

(assert (=> b!361561 (=> (not res!201130) (not e!221433))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361561 (= res!201130 (and (= (size!10005 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10004 _keys!1541) (size!10005 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361562 () Bool)

(declare-fun e!221435 () Bool)

(declare-fun mapRes!14109 () Bool)

(assert (=> b!361562 (= e!221434 (and e!221435 mapRes!14109))))

(declare-fun condMapEmpty!14109 () Bool)

(declare-fun mapDefault!14109 () ValueCell!3851)


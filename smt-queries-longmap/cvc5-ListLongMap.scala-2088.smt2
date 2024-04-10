; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35696 () Bool)

(assert start!35696)

(declare-fun res!199286 () Bool)

(declare-fun e!219493 () Bool)

(assert (=> start!35696 (=> (not res!199286) (not e!219493))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35696 (= res!199286 (validMask!0 mask!1842))))

(assert (=> start!35696 e!219493))

(assert (=> start!35696 true))

(declare-datatypes ((V!11843 0))(
  ( (V!11844 (val!4119 Int)) )
))
(declare-datatypes ((ValueCell!3731 0))(
  ( (ValueCellFull!3731 (v!6313 V!11843)) (EmptyCell!3731) )
))
(declare-datatypes ((array!19863 0))(
  ( (array!19864 (arr!9425 (Array (_ BitVec 32) ValueCell!3731)) (size!9777 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19863)

(declare-fun e!219496 () Bool)

(declare-fun array_inv!6930 (array!19863) Bool)

(assert (=> start!35696 (and (array_inv!6930 _values!1208) e!219496)))

(declare-datatypes ((array!19865 0))(
  ( (array!19866 (arr!9426 (Array (_ BitVec 32) (_ BitVec 64))) (size!9778 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19865)

(declare-fun array_inv!6931 (array!19865) Bool)

(assert (=> start!35696 (array_inv!6931 _keys!1456)))

(declare-fun b!358553 () Bool)

(declare-fun res!199288 () Bool)

(assert (=> b!358553 (=> (not res!199288) (not e!219493))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358553 (= res!199288 (and (= (size!9777 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9778 _keys!1456) (size!9777 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358554 () Bool)

(declare-fun res!199287 () Bool)

(assert (=> b!358554 (=> (not res!199287) (not e!219493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19865 (_ BitVec 32)) Bool)

(assert (=> b!358554 (= res!199287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358555 () Bool)

(declare-fun e!219495 () Bool)

(declare-fun mapRes!13731 () Bool)

(assert (=> b!358555 (= e!219496 (and e!219495 mapRes!13731))))

(declare-fun condMapEmpty!13731 () Bool)

(declare-fun mapDefault!13731 () ValueCell!3731)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84286 () Bool)

(assert start!84286)

(declare-fun res!659782 () Bool)

(declare-fun e!555881 () Bool)

(assert (=> start!84286 (=> (not res!659782) (not e!555881))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84286 (= res!659782 (validMask!0 mask!1948))))

(assert (=> start!84286 e!555881))

(assert (=> start!84286 true))

(declare-datatypes ((V!35769 0))(
  ( (V!35770 (val!11595 Int)) )
))
(declare-datatypes ((ValueCell!11063 0))(
  ( (ValueCellFull!11063 (v!14157 V!35769)) (EmptyCell!11063) )
))
(declare-datatypes ((array!62149 0))(
  ( (array!62150 (arr!29932 (Array (_ BitVec 32) ValueCell!11063)) (size!30411 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62149)

(declare-fun e!555878 () Bool)

(declare-fun array_inv!23133 (array!62149) Bool)

(assert (=> start!84286 (and (array_inv!23133 _values!1278) e!555878)))

(declare-datatypes ((array!62151 0))(
  ( (array!62152 (arr!29933 (Array (_ BitVec 32) (_ BitVec 64))) (size!30412 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62151)

(declare-fun array_inv!23134 (array!62151) Bool)

(assert (=> start!84286 (array_inv!23134 _keys!1544)))

(declare-fun b!986047 () Bool)

(declare-fun e!555880 () Bool)

(declare-fun tp_is_empty!23089 () Bool)

(assert (=> b!986047 (= e!555880 tp_is_empty!23089)))

(declare-fun b!986048 () Bool)

(declare-fun mapRes!36662 () Bool)

(assert (=> b!986048 (= e!555878 (and e!555880 mapRes!36662))))

(declare-fun condMapEmpty!36662 () Bool)

(declare-fun mapDefault!36662 () ValueCell!11063)


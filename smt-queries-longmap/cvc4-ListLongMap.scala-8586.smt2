; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104750 () Bool)

(assert start!104750)

(declare-fun b_free!26555 () Bool)

(declare-fun b_next!26555 () Bool)

(assert (=> start!104750 (= b_free!26555 (not b_next!26555))))

(declare-fun tp!93154 () Bool)

(declare-fun b_and!44323 () Bool)

(assert (=> start!104750 (= tp!93154 b_and!44323)))

(declare-fun res!833055 () Bool)

(declare-fun e!708621 () Bool)

(assert (=> start!104750 (=> (not res!833055) (not e!708621))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104750 (= res!833055 (validMask!0 mask!1466))))

(assert (=> start!104750 e!708621))

(assert (=> start!104750 true))

(assert (=> start!104750 tp!93154))

(declare-fun tp_is_empty!31457 () Bool)

(assert (=> start!104750 tp_is_empty!31457))

(declare-datatypes ((array!80602 0))(
  ( (array!80603 (arr!38868 (Array (_ BitVec 32) (_ BitVec 64))) (size!39404 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80602)

(declare-fun array_inv!29665 (array!80602) Bool)

(assert (=> start!104750 (array_inv!29665 _keys!1118)))

(declare-datatypes ((V!47307 0))(
  ( (V!47308 (val!15791 Int)) )
))
(declare-datatypes ((ValueCell!14965 0))(
  ( (ValueCellFull!14965 (v!18487 V!47307)) (EmptyCell!14965) )
))
(declare-datatypes ((array!80604 0))(
  ( (array!80605 (arr!38869 (Array (_ BitVec 32) ValueCell!14965)) (size!39405 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80604)

(declare-fun e!708622 () Bool)

(declare-fun array_inv!29666 (array!80604) Bool)

(assert (=> start!104750 (and (array_inv!29666 _values!914) e!708622)))

(declare-fun b!1248717 () Bool)

(declare-fun e!708619 () Bool)

(declare-fun mapRes!48946 () Bool)

(assert (=> b!1248717 (= e!708622 (and e!708619 mapRes!48946))))

(declare-fun condMapEmpty!48946 () Bool)

(declare-fun mapDefault!48946 () ValueCell!14965)


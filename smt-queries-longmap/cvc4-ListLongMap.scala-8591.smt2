; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104780 () Bool)

(assert start!104780)

(declare-fun b_free!26585 () Bool)

(declare-fun b_next!26585 () Bool)

(assert (=> start!104780 (= b_free!26585 (not b_next!26585))))

(declare-fun tp!93245 () Bool)

(declare-fun b_and!44353 () Bool)

(assert (=> start!104780 (= tp!93245 b_and!44353)))

(declare-fun b!1249032 () Bool)

(declare-fun e!708845 () Bool)

(declare-fun e!708843 () Bool)

(declare-fun mapRes!48991 () Bool)

(assert (=> b!1249032 (= e!708845 (and e!708843 mapRes!48991))))

(declare-fun condMapEmpty!48991 () Bool)

(declare-datatypes ((V!47347 0))(
  ( (V!47348 (val!15806 Int)) )
))
(declare-datatypes ((ValueCell!14980 0))(
  ( (ValueCellFull!14980 (v!18502 V!47347)) (EmptyCell!14980) )
))
(declare-datatypes ((array!80660 0))(
  ( (array!80661 (arr!38897 (Array (_ BitVec 32) ValueCell!14980)) (size!39433 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80660)

(declare-fun mapDefault!48991 () ValueCell!14980)


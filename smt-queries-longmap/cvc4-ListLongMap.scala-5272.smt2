; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70786 () Bool)

(assert start!70786)

(declare-fun b_free!13043 () Bool)

(declare-fun b_next!13043 () Bool)

(assert (=> start!70786 (= b_free!13043 (not b_next!13043))))

(declare-fun tp!45874 () Bool)

(declare-fun b_and!21915 () Bool)

(assert (=> start!70786 (= tp!45874 b_and!21915)))

(declare-fun b!822190 () Bool)

(declare-fun res!560799 () Bool)

(declare-fun e!457072 () Bool)

(assert (=> b!822190 (=> (not res!560799) (not e!457072))))

(declare-datatypes ((array!45700 0))(
  ( (array!45701 (arr!21900 (Array (_ BitVec 32) (_ BitVec 64))) (size!22321 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45700)

(declare-datatypes ((List!15617 0))(
  ( (Nil!15614) (Cons!15613 (h!16742 (_ BitVec 64)) (t!21954 List!15617)) )
))
(declare-fun arrayNoDuplicates!0 (array!45700 (_ BitVec 32) List!15617) Bool)

(assert (=> b!822190 (= res!560799 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15614))))

(declare-fun res!560796 () Bool)

(assert (=> start!70786 (=> (not res!560796) (not e!457072))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70786 (= res!560796 (validMask!0 mask!1312))))

(assert (=> start!70786 e!457072))

(declare-fun tp_is_empty!14753 () Bool)

(assert (=> start!70786 tp_is_empty!14753))

(declare-fun array_inv!17493 (array!45700) Bool)

(assert (=> start!70786 (array_inv!17493 _keys!976)))

(assert (=> start!70786 true))

(declare-datatypes ((V!24671 0))(
  ( (V!24672 (val!7424 Int)) )
))
(declare-datatypes ((ValueCell!6961 0))(
  ( (ValueCellFull!6961 (v!9855 V!24671)) (EmptyCell!6961) )
))
(declare-datatypes ((array!45702 0))(
  ( (array!45703 (arr!21901 (Array (_ BitVec 32) ValueCell!6961)) (size!22322 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45702)

(declare-fun e!457074 () Bool)

(declare-fun array_inv!17494 (array!45702) Bool)

(assert (=> start!70786 (and (array_inv!17494 _values!788) e!457074)))

(assert (=> start!70786 tp!45874))

(declare-fun b!822191 () Bool)

(declare-fun res!560797 () Bool)

(assert (=> b!822191 (=> (not res!560797) (not e!457072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45700 (_ BitVec 32)) Bool)

(assert (=> b!822191 (= res!560797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822192 () Bool)

(declare-fun e!457073 () Bool)

(assert (=> b!822192 (= e!457073 tp_is_empty!14753)))

(declare-fun b!822193 () Bool)

(declare-fun e!457077 () Bool)

(declare-fun mapRes!23740 () Bool)

(assert (=> b!822193 (= e!457074 (and e!457077 mapRes!23740))))

(declare-fun condMapEmpty!23740 () Bool)

(declare-fun mapDefault!23740 () ValueCell!6961)


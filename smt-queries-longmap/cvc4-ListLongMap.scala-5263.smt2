; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70716 () Bool)

(assert start!70716)

(declare-fun b_free!12989 () Bool)

(declare-fun b_next!12989 () Bool)

(assert (=> start!70716 (= b_free!12989 (not b_next!12989))))

(declare-fun tp!45709 () Bool)

(declare-fun b_and!21851 () Bool)

(assert (=> start!70716 (= tp!45709 b_and!21851)))

(declare-fun b!821385 () Bool)

(declare-fun e!456483 () Bool)

(declare-fun tp_is_empty!14699 () Bool)

(assert (=> b!821385 (= e!456483 tp_is_empty!14699)))

(declare-fun b!821386 () Bool)

(declare-fun res!560327 () Bool)

(declare-fun e!456488 () Bool)

(assert (=> b!821386 (=> (not res!560327) (not e!456488))))

(declare-datatypes ((array!45594 0))(
  ( (array!45595 (arr!21848 (Array (_ BitVec 32) (_ BitVec 64))) (size!22269 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45594)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24599 0))(
  ( (V!24600 (val!7397 Int)) )
))
(declare-datatypes ((ValueCell!6934 0))(
  ( (ValueCellFull!6934 (v!9828 V!24599)) (EmptyCell!6934) )
))
(declare-datatypes ((array!45596 0))(
  ( (array!45597 (arr!21849 (Array (_ BitVec 32) ValueCell!6934)) (size!22270 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45596)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821386 (= res!560327 (and (= (size!22270 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22269 _keys!976) (size!22270 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821387 () Bool)

(declare-fun res!560326 () Bool)

(assert (=> b!821387 (=> (not res!560326) (not e!456488))))

(declare-datatypes ((List!15577 0))(
  ( (Nil!15574) (Cons!15573 (h!16702 (_ BitVec 64)) (t!21912 List!15577)) )
))
(declare-fun arrayNoDuplicates!0 (array!45594 (_ BitVec 32) List!15577) Bool)

(assert (=> b!821387 (= res!560326 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15574))))

(declare-fun res!560325 () Bool)

(assert (=> start!70716 (=> (not res!560325) (not e!456488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70716 (= res!560325 (validMask!0 mask!1312))))

(assert (=> start!70716 e!456488))

(assert (=> start!70716 tp_is_empty!14699))

(declare-fun array_inv!17461 (array!45594) Bool)

(assert (=> start!70716 (array_inv!17461 _keys!976)))

(assert (=> start!70716 true))

(declare-fun e!456487 () Bool)

(declare-fun array_inv!17462 (array!45596) Bool)

(assert (=> start!70716 (and (array_inv!17462 _values!788) e!456487)))

(assert (=> start!70716 tp!45709))

(declare-fun mapIsEmpty!23656 () Bool)

(declare-fun mapRes!23656 () Bool)

(assert (=> mapIsEmpty!23656 mapRes!23656))

(declare-fun mapNonEmpty!23656 () Bool)

(declare-fun tp!45708 () Bool)

(declare-fun e!456486 () Bool)

(assert (=> mapNonEmpty!23656 (= mapRes!23656 (and tp!45708 e!456486))))

(declare-fun mapKey!23656 () (_ BitVec 32))

(declare-fun mapRest!23656 () (Array (_ BitVec 32) ValueCell!6934))

(declare-fun mapValue!23656 () ValueCell!6934)

(assert (=> mapNonEmpty!23656 (= (arr!21849 _values!788) (store mapRest!23656 mapKey!23656 mapValue!23656))))

(declare-fun b!821388 () Bool)

(declare-fun res!560323 () Bool)

(assert (=> b!821388 (=> (not res!560323) (not e!456488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45594 (_ BitVec 32)) Bool)

(assert (=> b!821388 (= res!560323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821389 () Bool)

(assert (=> b!821389 (= e!456486 tp_is_empty!14699)))

(declare-fun b!821390 () Bool)

(assert (=> b!821390 (= e!456487 (and e!456483 mapRes!23656))))

(declare-fun condMapEmpty!23656 () Bool)

(declare-fun mapDefault!23656 () ValueCell!6934)


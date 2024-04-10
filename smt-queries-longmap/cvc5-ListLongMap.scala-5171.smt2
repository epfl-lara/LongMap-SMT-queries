; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70012 () Bool)

(assert start!70012)

(declare-fun b_free!12433 () Bool)

(declare-fun b_next!12433 () Bool)

(assert (=> start!70012 (= b_free!12433 (not b_next!12433))))

(declare-fun tp!44014 () Bool)

(declare-fun b_and!21205 () Bool)

(assert (=> start!70012 (= tp!44014 b_and!21205)))

(declare-fun b!813701 () Bool)

(declare-fun res!555857 () Bool)

(declare-fun e!450930 () Bool)

(assert (=> b!813701 (=> (not res!555857) (not e!450930))))

(declare-datatypes ((array!44494 0))(
  ( (array!44495 (arr!21307 (Array (_ BitVec 32) (_ BitVec 64))) (size!21728 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44494)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23859 0))(
  ( (V!23860 (val!7119 Int)) )
))
(declare-datatypes ((ValueCell!6656 0))(
  ( (ValueCellFull!6656 (v!9546 V!23859)) (EmptyCell!6656) )
))
(declare-datatypes ((array!44496 0))(
  ( (array!44497 (arr!21308 (Array (_ BitVec 32) ValueCell!6656)) (size!21729 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44496)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813701 (= res!555857 (and (= (size!21729 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21728 _keys!976) (size!21729 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813702 () Bool)

(declare-fun res!555855 () Bool)

(assert (=> b!813702 (=> (not res!555855) (not e!450930))))

(declare-datatypes ((List!15157 0))(
  ( (Nil!15154) (Cons!15153 (h!16282 (_ BitVec 64)) (t!21474 List!15157)) )
))
(declare-fun arrayNoDuplicates!0 (array!44494 (_ BitVec 32) List!15157) Bool)

(assert (=> b!813702 (= res!555855 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15154))))

(declare-fun b!813703 () Bool)

(declare-fun res!555858 () Bool)

(assert (=> b!813703 (=> (not res!555858) (not e!450930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44494 (_ BitVec 32)) Bool)

(assert (=> b!813703 (= res!555858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813704 () Bool)

(declare-fun e!450931 () Bool)

(declare-fun tp_is_empty!14143 () Bool)

(assert (=> b!813704 (= e!450931 tp_is_empty!14143)))

(declare-fun b!813705 () Bool)

(declare-fun e!450933 () Bool)

(declare-fun e!450932 () Bool)

(declare-fun mapRes!22795 () Bool)

(assert (=> b!813705 (= e!450933 (and e!450932 mapRes!22795))))

(declare-fun condMapEmpty!22795 () Bool)

(declare-fun mapDefault!22795 () ValueCell!6656)


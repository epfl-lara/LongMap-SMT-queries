; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93982 () Bool)

(assert start!93982)

(declare-fun b_free!21419 () Bool)

(declare-fun b_next!21419 () Bool)

(assert (=> start!93982 (= b_free!21419 (not b_next!21419))))

(declare-fun tp!75686 () Bool)

(declare-fun b_and!34151 () Bool)

(assert (=> start!93982 (= tp!75686 b_and!34151)))

(declare-fun b!1062890 () Bool)

(declare-fun e!605522 () Bool)

(declare-fun tp_is_empty!25229 () Bool)

(assert (=> b!1062890 (= e!605522 tp_is_empty!25229)))

(declare-fun b!1062891 () Bool)

(declare-fun res!709687 () Bool)

(declare-fun e!605521 () Bool)

(assert (=> b!1062891 (=> (not res!709687) (not e!605521))))

(declare-datatypes ((array!67463 0))(
  ( (array!67464 (arr!32437 (Array (_ BitVec 32) (_ BitVec 64))) (size!32973 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67463)

(declare-datatypes ((List!22610 0))(
  ( (Nil!22607) (Cons!22606 (h!23815 (_ BitVec 64)) (t!31923 List!22610)) )
))
(declare-fun arrayNoDuplicates!0 (array!67463 (_ BitVec 32) List!22610) Bool)

(assert (=> b!1062891 (= res!709687 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22607))))

(declare-fun b!1062892 () Bool)

(declare-fun res!709685 () Bool)

(assert (=> b!1062892 (=> (not res!709685) (not e!605521))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38773 0))(
  ( (V!38774 (val!12665 Int)) )
))
(declare-datatypes ((ValueCell!11911 0))(
  ( (ValueCellFull!11911 (v!15276 V!38773)) (EmptyCell!11911) )
))
(declare-datatypes ((array!67465 0))(
  ( (array!67466 (arr!32438 (Array (_ BitVec 32) ValueCell!11911)) (size!32974 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67465)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062892 (= res!709685 (and (= (size!32974 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32973 _keys!1163) (size!32974 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709688 () Bool)

(assert (=> start!93982 (=> (not res!709688) (not e!605521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93982 (= res!709688 (validMask!0 mask!1515))))

(assert (=> start!93982 e!605521))

(assert (=> start!93982 true))

(assert (=> start!93982 tp_is_empty!25229))

(declare-fun e!605518 () Bool)

(declare-fun array_inv!25128 (array!67465) Bool)

(assert (=> start!93982 (and (array_inv!25128 _values!955) e!605518)))

(assert (=> start!93982 tp!75686))

(declare-fun array_inv!25129 (array!67463) Bool)

(assert (=> start!93982 (array_inv!25129 _keys!1163)))

(declare-fun mapIsEmpty!39520 () Bool)

(declare-fun mapRes!39520 () Bool)

(assert (=> mapIsEmpty!39520 mapRes!39520))

(declare-fun b!1062893 () Bool)

(declare-fun res!709686 () Bool)

(assert (=> b!1062893 (=> (not res!709686) (not e!605521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67463 (_ BitVec 32)) Bool)

(assert (=> b!1062893 (= res!709686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39520 () Bool)

(declare-fun tp!75685 () Bool)

(declare-fun e!605519 () Bool)

(assert (=> mapNonEmpty!39520 (= mapRes!39520 (and tp!75685 e!605519))))

(declare-fun mapRest!39520 () (Array (_ BitVec 32) ValueCell!11911))

(declare-fun mapKey!39520 () (_ BitVec 32))

(declare-fun mapValue!39520 () ValueCell!11911)

(assert (=> mapNonEmpty!39520 (= (arr!32438 _values!955) (store mapRest!39520 mapKey!39520 mapValue!39520))))

(declare-fun b!1062894 () Bool)

(assert (=> b!1062894 (= e!605519 tp_is_empty!25229)))

(declare-fun b!1062895 () Bool)

(assert (=> b!1062895 (= e!605518 (and e!605522 mapRes!39520))))

(declare-fun condMapEmpty!39520 () Bool)

(declare-fun mapDefault!39520 () ValueCell!11911)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81864 () Bool)

(assert start!81864)

(declare-fun b_free!18359 () Bool)

(declare-fun b_next!18359 () Bool)

(assert (=> start!81864 (= b_free!18359 (not b_next!18359))))

(declare-fun tp!63777 () Bool)

(declare-fun b_and!29845 () Bool)

(assert (=> start!81864 (= tp!63777 b_and!29845)))

(declare-fun res!639325 () Bool)

(declare-fun e!537879 () Bool)

(assert (=> start!81864 (=> (not res!639325) (not e!537879))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81864 (= res!639325 (validMask!0 mask!1823))))

(assert (=> start!81864 e!537879))

(assert (=> start!81864 true))

(declare-fun tp_is_empty!20903 () Bool)

(assert (=> start!81864 tp_is_empty!20903))

(declare-datatypes ((array!57917 0))(
  ( (array!57918 (arr!27838 (Array (_ BitVec 32) (_ BitVec 64))) (size!28317 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57917)

(declare-fun array_inv!21609 (array!57917) Bool)

(assert (=> start!81864 (array_inv!21609 _keys!1441)))

(declare-datatypes ((V!32853 0))(
  ( (V!32854 (val!10502 Int)) )
))
(declare-datatypes ((ValueCell!9970 0))(
  ( (ValueCellFull!9970 (v!13057 V!32853)) (EmptyCell!9970) )
))
(declare-datatypes ((array!57919 0))(
  ( (array!57920 (arr!27839 (Array (_ BitVec 32) ValueCell!9970)) (size!28318 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57919)

(declare-fun e!537883 () Bool)

(declare-fun array_inv!21610 (array!57919) Bool)

(assert (=> start!81864 (and (array_inv!21610 _values!1197) e!537883)))

(assert (=> start!81864 tp!63777))

(declare-fun mapIsEmpty!33316 () Bool)

(declare-fun mapRes!33316 () Bool)

(assert (=> mapIsEmpty!33316 mapRes!33316))

(declare-fun b!954724 () Bool)

(declare-fun res!639330 () Bool)

(assert (=> b!954724 (=> (not res!639330) (not e!537879))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954724 (= res!639330 (and (= (size!28318 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28317 _keys!1441) (size!28318 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954725 () Bool)

(declare-fun res!639328 () Bool)

(assert (=> b!954725 (=> (not res!639328) (not e!537879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57917 (_ BitVec 32)) Bool)

(assert (=> b!954725 (= res!639328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954726 () Bool)

(declare-fun res!639327 () Bool)

(assert (=> b!954726 (=> (not res!639327) (not e!537879))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954726 (= res!639327 (validKeyInArray!0 (select (arr!27838 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33316 () Bool)

(declare-fun tp!63776 () Bool)

(declare-fun e!537880 () Bool)

(assert (=> mapNonEmpty!33316 (= mapRes!33316 (and tp!63776 e!537880))))

(declare-fun mapValue!33316 () ValueCell!9970)

(declare-fun mapKey!33316 () (_ BitVec 32))

(declare-fun mapRest!33316 () (Array (_ BitVec 32) ValueCell!9970))

(assert (=> mapNonEmpty!33316 (= (arr!27839 _values!1197) (store mapRest!33316 mapKey!33316 mapValue!33316))))

(declare-fun b!954727 () Bool)

(declare-fun res!639326 () Bool)

(assert (=> b!954727 (=> (not res!639326) (not e!537879))))

(assert (=> b!954727 (= res!639326 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28317 _keys!1441))))))

(declare-fun b!954728 () Bool)

(assert (=> b!954728 (= e!537880 tp_is_empty!20903)))

(declare-fun b!954729 () Bool)

(declare-fun e!537881 () Bool)

(assert (=> b!954729 (= e!537881 tp_is_empty!20903)))

(declare-fun b!954730 () Bool)

(assert (=> b!954730 (= e!537883 (and e!537881 mapRes!33316))))

(declare-fun condMapEmpty!33316 () Bool)

(declare-fun mapDefault!33316 () ValueCell!9970)


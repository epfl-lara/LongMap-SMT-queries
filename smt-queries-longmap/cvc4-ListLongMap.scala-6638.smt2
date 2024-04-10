; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83804 () Bool)

(assert start!83804)

(declare-fun b_free!19613 () Bool)

(declare-fun b_next!19613 () Bool)

(assert (=> start!83804 (= b_free!19613 (not b_next!19613))))

(declare-fun tp!68280 () Bool)

(declare-fun b_and!31315 () Bool)

(assert (=> start!83804 (= tp!68280 b_and!31315)))

(declare-fun b!978781 () Bool)

(declare-fun res!655016 () Bool)

(declare-fun e!551779 () Bool)

(assert (=> b!978781 (=> (not res!655016) (not e!551779))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61239 0))(
  ( (array!61240 (arr!29477 (Array (_ BitVec 32) (_ BitVec 64))) (size!29956 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61239)

(assert (=> b!978781 (= res!655016 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29956 _keys!1544))))))

(declare-fun mapNonEmpty!35939 () Bool)

(declare-fun mapRes!35939 () Bool)

(declare-fun tp!68281 () Bool)

(declare-fun e!551780 () Bool)

(assert (=> mapNonEmpty!35939 (= mapRes!35939 (and tp!68281 e!551780))))

(declare-datatypes ((V!35125 0))(
  ( (V!35126 (val!11354 Int)) )
))
(declare-datatypes ((ValueCell!10822 0))(
  ( (ValueCellFull!10822 (v!13916 V!35125)) (EmptyCell!10822) )
))
(declare-fun mapRest!35939 () (Array (_ BitVec 32) ValueCell!10822))

(declare-datatypes ((array!61241 0))(
  ( (array!61242 (arr!29478 (Array (_ BitVec 32) ValueCell!10822)) (size!29957 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61241)

(declare-fun mapValue!35939 () ValueCell!10822)

(declare-fun mapKey!35939 () (_ BitVec 32))

(assert (=> mapNonEmpty!35939 (= (arr!29478 _values!1278) (store mapRest!35939 mapKey!35939 mapValue!35939))))

(declare-fun b!978782 () Bool)

(declare-fun tp_is_empty!22607 () Bool)

(assert (=> b!978782 (= e!551780 tp_is_empty!22607)))

(declare-fun b!978783 () Bool)

(declare-fun res!655022 () Bool)

(assert (=> b!978783 (=> (not res!655022) (not e!551779))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978783 (= res!655022 (and (= (size!29957 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29956 _keys!1544) (size!29957 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978784 () Bool)

(declare-fun res!655021 () Bool)

(assert (=> b!978784 (=> (not res!655021) (not e!551779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978784 (= res!655021 (validKeyInArray!0 (select (arr!29477 _keys!1544) from!1932)))))

(declare-fun b!978785 () Bool)

(declare-fun res!655019 () Bool)

(assert (=> b!978785 (=> (not res!655019) (not e!551779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61239 (_ BitVec 32)) Bool)

(assert (=> b!978785 (= res!655019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!655017 () Bool)

(assert (=> start!83804 (=> (not res!655017) (not e!551779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83804 (= res!655017 (validMask!0 mask!1948))))

(assert (=> start!83804 e!551779))

(assert (=> start!83804 true))

(assert (=> start!83804 tp_is_empty!22607))

(declare-fun e!551778 () Bool)

(declare-fun array_inv!22789 (array!61241) Bool)

(assert (=> start!83804 (and (array_inv!22789 _values!1278) e!551778)))

(assert (=> start!83804 tp!68280))

(declare-fun array_inv!22790 (array!61239) Bool)

(assert (=> start!83804 (array_inv!22790 _keys!1544)))

(declare-fun b!978786 () Bool)

(assert (=> b!978786 (= e!551779 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14564 0))(
  ( (tuple2!14565 (_1!7293 (_ BitVec 64)) (_2!7293 V!35125)) )
))
(declare-datatypes ((List!20434 0))(
  ( (Nil!20431) (Cons!20430 (h!21592 tuple2!14564) (t!29003 List!20434)) )
))
(declare-datatypes ((ListLongMap!13261 0))(
  ( (ListLongMap!13262 (toList!6646 List!20434)) )
))
(declare-fun lt!433931 () ListLongMap!13261)

(declare-fun lt!433930 () tuple2!14564)

(declare-fun lt!433932 () tuple2!14564)

(declare-fun +!2951 (ListLongMap!13261 tuple2!14564) ListLongMap!13261)

(assert (=> b!978786 (= (+!2951 (+!2951 lt!433931 lt!433930) lt!433932) (+!2951 (+!2951 lt!433931 lt!433932) lt!433930))))

(declare-fun lt!433934 () V!35125)

(assert (=> b!978786 (= lt!433932 (tuple2!14565 (select (arr!29477 _keys!1544) from!1932) lt!433934))))

(declare-fun minValue!1220 () V!35125)

(assert (=> b!978786 (= lt!433930 (tuple2!14565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32541 0))(
  ( (Unit!32542) )
))
(declare-fun lt!433933 () Unit!32541)

(declare-fun addCommutativeForDiffKeys!579 (ListLongMap!13261 (_ BitVec 64) V!35125 (_ BitVec 64) V!35125) Unit!32541)

(assert (=> b!978786 (= lt!433933 (addCommutativeForDiffKeys!579 lt!433931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29477 _keys!1544) from!1932) lt!433934))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15268 (ValueCell!10822 V!35125) V!35125)

(declare-fun dynLambda!1739 (Int (_ BitVec 64)) V!35125)

(assert (=> b!978786 (= lt!433934 (get!15268 (select (arr!29478 _values!1278) from!1932) (dynLambda!1739 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35125)

(declare-fun getCurrentListMapNoExtraKeys!3353 (array!61239 array!61241 (_ BitVec 32) (_ BitVec 32) V!35125 V!35125 (_ BitVec 32) Int) ListLongMap!13261)

(assert (=> b!978786 (= lt!433931 (+!2951 (getCurrentListMapNoExtraKeys!3353 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!35939 () Bool)

(assert (=> mapIsEmpty!35939 mapRes!35939))

(declare-fun b!978787 () Bool)

(declare-fun e!551781 () Bool)

(assert (=> b!978787 (= e!551778 (and e!551781 mapRes!35939))))

(declare-fun condMapEmpty!35939 () Bool)

(declare-fun mapDefault!35939 () ValueCell!10822)


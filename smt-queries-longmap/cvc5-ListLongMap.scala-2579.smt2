; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39292 () Bool)

(assert start!39292)

(declare-fun b_free!9559 () Bool)

(declare-fun b_next!9559 () Bool)

(assert (=> start!39292 (= b_free!9559 (not b_next!9559))))

(declare-fun tp!34206 () Bool)

(declare-fun b_and!16993 () Bool)

(assert (=> start!39292 (= tp!34206 b_and!16993)))

(declare-fun mapNonEmpty!17688 () Bool)

(declare-fun mapRes!17688 () Bool)

(declare-fun tp!34205 () Bool)

(declare-fun e!248299 () Bool)

(assert (=> mapNonEmpty!17688 (= mapRes!17688 (and tp!34205 e!248299))))

(declare-fun mapKey!17688 () (_ BitVec 32))

(declare-datatypes ((V!15387 0))(
  ( (V!15388 (val!5400 Int)) )
))
(declare-datatypes ((ValueCell!5012 0))(
  ( (ValueCellFull!5012 (v!7647 V!15387)) (EmptyCell!5012) )
))
(declare-datatypes ((array!25279 0))(
  ( (array!25280 (arr!12089 (Array (_ BitVec 32) ValueCell!5012)) (size!12441 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25279)

(declare-fun mapValue!17688 () ValueCell!5012)

(declare-fun mapRest!17688 () (Array (_ BitVec 32) ValueCell!5012))

(assert (=> mapNonEmpty!17688 (= (arr!12089 _values!549) (store mapRest!17688 mapKey!17688 mapValue!17688))))

(declare-fun b!415778 () Bool)

(declare-fun e!248304 () Bool)

(declare-fun e!248302 () Bool)

(assert (=> b!415778 (= e!248304 e!248302)))

(declare-fun res!241927 () Bool)

(assert (=> b!415778 (=> (not res!241927) (not e!248302))))

(declare-datatypes ((array!25281 0))(
  ( (array!25282 (arr!12090 (Array (_ BitVec 32) (_ BitVec 64))) (size!12442 (_ BitVec 32))) )
))
(declare-fun lt!190341 () array!25281)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25281 (_ BitVec 32)) Bool)

(assert (=> b!415778 (= res!241927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190341 mask!1025))))

(declare-fun _keys!709 () array!25281)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415778 (= lt!190341 (array!25282 (store (arr!12090 _keys!709) i!563 k!794) (size!12442 _keys!709)))))

(declare-fun b!415779 () Bool)

(declare-fun e!248296 () Bool)

(declare-fun e!248300 () Bool)

(assert (=> b!415779 (= e!248296 (not e!248300))))

(declare-fun res!241932 () Bool)

(assert (=> b!415779 (=> res!241932 e!248300)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415779 (= res!241932 (validKeyInArray!0 (select (arr!12090 _keys!709) from!863)))))

(declare-fun e!248298 () Bool)

(assert (=> b!415779 e!248298))

(declare-fun c!55052 () Bool)

(assert (=> b!415779 (= c!55052 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12292 0))(
  ( (Unit!12293) )
))
(declare-fun lt!190343 () Unit!12292)

(declare-fun minValue!515 () V!15387)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15387)

(declare-fun v!412 () V!15387)

(declare-fun defaultEntry!557 () Int)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 (array!25281 array!25279 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) (_ BitVec 64) V!15387 (_ BitVec 32) Int) Unit!12292)

(assert (=> b!415779 (= lt!190343 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415780 () Bool)

(assert (=> b!415780 (= e!248302 e!248296)))

(declare-fun res!241922 () Bool)

(assert (=> b!415780 (=> (not res!241922) (not e!248296))))

(assert (=> b!415780 (= res!241922 (= from!863 i!563))))

(declare-datatypes ((tuple2!7036 0))(
  ( (tuple2!7037 (_1!3529 (_ BitVec 64)) (_2!3529 V!15387)) )
))
(declare-datatypes ((List!7057 0))(
  ( (Nil!7054) (Cons!7053 (h!7909 tuple2!7036) (t!12281 List!7057)) )
))
(declare-datatypes ((ListLongMap!5949 0))(
  ( (ListLongMap!5950 (toList!2990 List!7057)) )
))
(declare-fun lt!190340 () ListLongMap!5949)

(declare-fun lt!190342 () array!25279)

(declare-fun getCurrentListMapNoExtraKeys!1196 (array!25281 array!25279 (_ BitVec 32) (_ BitVec 32) V!15387 V!15387 (_ BitVec 32) Int) ListLongMap!5949)

(assert (=> b!415780 (= lt!190340 (getCurrentListMapNoExtraKeys!1196 lt!190341 lt!190342 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415780 (= lt!190342 (array!25280 (store (arr!12089 _values!549) i!563 (ValueCellFull!5012 v!412)) (size!12441 _values!549)))))

(declare-fun lt!190339 () ListLongMap!5949)

(assert (=> b!415780 (= lt!190339 (getCurrentListMapNoExtraKeys!1196 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415781 () Bool)

(declare-fun res!241924 () Bool)

(assert (=> b!415781 (=> (not res!241924) (not e!248304))))

(assert (=> b!415781 (= res!241924 (or (= (select (arr!12090 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12090 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415782 () Bool)

(declare-fun call!28855 () ListLongMap!5949)

(declare-fun call!28856 () ListLongMap!5949)

(assert (=> b!415782 (= e!248298 (= call!28855 call!28856))))

(declare-fun b!415783 () Bool)

(declare-fun res!241929 () Bool)

(assert (=> b!415783 (=> (not res!241929) (not e!248304))))

(assert (=> b!415783 (= res!241929 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!17688 () Bool)

(assert (=> mapIsEmpty!17688 mapRes!17688))

(declare-fun bm!28852 () Bool)

(assert (=> bm!28852 (= call!28856 (getCurrentListMapNoExtraKeys!1196 (ite c!55052 lt!190341 _keys!709) (ite c!55052 lt!190342 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415784 () Bool)

(declare-fun res!241923 () Bool)

(assert (=> b!415784 (=> (not res!241923) (not e!248304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415784 (= res!241923 (validMask!0 mask!1025))))

(declare-fun bm!28853 () Bool)

(assert (=> bm!28853 (= call!28855 (getCurrentListMapNoExtraKeys!1196 (ite c!55052 _keys!709 lt!190341) (ite c!55052 _values!549 lt!190342) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241935 () Bool)

(assert (=> start!39292 (=> (not res!241935) (not e!248304))))

(assert (=> start!39292 (= res!241935 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12442 _keys!709))))))

(assert (=> start!39292 e!248304))

(declare-fun tp_is_empty!10711 () Bool)

(assert (=> start!39292 tp_is_empty!10711))

(assert (=> start!39292 tp!34206))

(assert (=> start!39292 true))

(declare-fun e!248297 () Bool)

(declare-fun array_inv!8818 (array!25279) Bool)

(assert (=> start!39292 (and (array_inv!8818 _values!549) e!248297)))

(declare-fun array_inv!8819 (array!25281) Bool)

(assert (=> start!39292 (array_inv!8819 _keys!709)))

(declare-fun b!415785 () Bool)

(assert (=> b!415785 (= e!248299 tp_is_empty!10711)))

(declare-fun b!415786 () Bool)

(declare-fun res!241930 () Bool)

(assert (=> b!415786 (=> (not res!241930) (not e!248302))))

(declare-datatypes ((List!7058 0))(
  ( (Nil!7055) (Cons!7054 (h!7910 (_ BitVec 64)) (t!12282 List!7058)) )
))
(declare-fun arrayNoDuplicates!0 (array!25281 (_ BitVec 32) List!7058) Bool)

(assert (=> b!415786 (= res!241930 (arrayNoDuplicates!0 lt!190341 #b00000000000000000000000000000000 Nil!7055))))

(declare-fun b!415787 () Bool)

(declare-fun res!241928 () Bool)

(assert (=> b!415787 (=> (not res!241928) (not e!248302))))

(assert (=> b!415787 (= res!241928 (bvsle from!863 i!563))))

(declare-fun b!415788 () Bool)

(declare-fun res!241925 () Bool)

(assert (=> b!415788 (=> (not res!241925) (not e!248304))))

(assert (=> b!415788 (= res!241925 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12442 _keys!709))))))

(declare-fun b!415789 () Bool)

(declare-fun res!241934 () Bool)

(assert (=> b!415789 (=> (not res!241934) (not e!248304))))

(assert (=> b!415789 (= res!241934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415790 () Bool)

(declare-fun +!1193 (ListLongMap!5949 tuple2!7036) ListLongMap!5949)

(assert (=> b!415790 (= e!248298 (= call!28856 (+!1193 call!28855 (tuple2!7037 k!794 v!412))))))

(declare-fun b!415791 () Bool)

(assert (=> b!415791 (= e!248300 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12442 _keys!709))))))

(declare-fun get!5971 (ValueCell!5012 V!15387) V!15387)

(declare-fun dynLambda!670 (Int (_ BitVec 64)) V!15387)

(assert (=> b!415791 (= lt!190340 (+!1193 (getCurrentListMapNoExtraKeys!1196 lt!190341 lt!190342 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7037 (select (arr!12090 lt!190341) from!863) (get!5971 (select (arr!12089 lt!190342) from!863) (dynLambda!670 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415792 () Bool)

(declare-fun res!241926 () Bool)

(assert (=> b!415792 (=> (not res!241926) (not e!248304))))

(assert (=> b!415792 (= res!241926 (and (= (size!12441 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12442 _keys!709) (size!12441 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415793 () Bool)

(declare-fun e!248303 () Bool)

(assert (=> b!415793 (= e!248297 (and e!248303 mapRes!17688))))

(declare-fun condMapEmpty!17688 () Bool)

(declare-fun mapDefault!17688 () ValueCell!5012)


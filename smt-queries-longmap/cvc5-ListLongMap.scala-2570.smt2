; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39238 () Bool)

(assert start!39238)

(declare-fun b_free!9505 () Bool)

(declare-fun b_next!9505 () Bool)

(assert (=> start!39238 (= b_free!9505 (not b_next!9505))))

(declare-fun tp!34044 () Bool)

(declare-fun b_and!16891 () Bool)

(assert (=> start!39238 (= tp!34044 b_and!16891)))

(declare-fun b!414191 () Bool)

(declare-fun res!240791 () Bool)

(declare-fun e!247573 () Bool)

(assert (=> b!414191 (=> (not res!240791) (not e!247573))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414191 (= res!240791 (validMask!0 mask!1025))))

(declare-fun b!414192 () Bool)

(declare-fun res!240798 () Bool)

(assert (=> b!414192 (=> (not res!240798) (not e!247573))))

(declare-datatypes ((array!25171 0))(
  ( (array!25172 (arr!12035 (Array (_ BitVec 32) (_ BitVec 64))) (size!12387 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25171)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25171 (_ BitVec 32)) Bool)

(assert (=> b!414192 (= res!240798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414193 () Bool)

(declare-fun res!240796 () Bool)

(declare-fun e!247574 () Bool)

(assert (=> b!414193 (=> (not res!240796) (not e!247574))))

(declare-fun lt!189934 () array!25171)

(declare-datatypes ((List!7009 0))(
  ( (Nil!7006) (Cons!7005 (h!7861 (_ BitVec 64)) (t!12183 List!7009)) )
))
(declare-fun arrayNoDuplicates!0 (array!25171 (_ BitVec 32) List!7009) Bool)

(assert (=> b!414193 (= res!240796 (arrayNoDuplicates!0 lt!189934 #b00000000000000000000000000000000 Nil!7006))))

(declare-fun b!414194 () Bool)

(declare-fun e!247567 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!414194 (= e!247567 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12387 _keys!709))))))

(declare-fun b!414195 () Bool)

(declare-fun res!240801 () Bool)

(assert (=> b!414195 (=> (not res!240801) (not e!247574))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414195 (= res!240801 (bvsle from!863 i!563))))

(declare-fun b!414196 () Bool)

(declare-fun e!247570 () Bool)

(declare-datatypes ((V!15315 0))(
  ( (V!15316 (val!5373 Int)) )
))
(declare-datatypes ((tuple2!6986 0))(
  ( (tuple2!6987 (_1!3504 (_ BitVec 64)) (_2!3504 V!15315)) )
))
(declare-datatypes ((List!7010 0))(
  ( (Nil!7007) (Cons!7006 (h!7862 tuple2!6986) (t!12184 List!7010)) )
))
(declare-datatypes ((ListLongMap!5899 0))(
  ( (ListLongMap!5900 (toList!2965 List!7010)) )
))
(declare-fun call!28693 () ListLongMap!5899)

(declare-fun call!28694 () ListLongMap!5899)

(assert (=> b!414196 (= e!247570 (= call!28693 call!28694))))

(declare-fun b!414197 () Bool)

(declare-fun res!240793 () Bool)

(assert (=> b!414197 (=> (not res!240793) (not e!247573))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414197 (= res!240793 (validKeyInArray!0 k!794))))

(declare-fun res!240797 () Bool)

(assert (=> start!39238 (=> (not res!240797) (not e!247573))))

(assert (=> start!39238 (= res!240797 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12387 _keys!709))))))

(assert (=> start!39238 e!247573))

(declare-fun tp_is_empty!10657 () Bool)

(assert (=> start!39238 tp_is_empty!10657))

(assert (=> start!39238 tp!34044))

(assert (=> start!39238 true))

(declare-datatypes ((ValueCell!4985 0))(
  ( (ValueCellFull!4985 (v!7620 V!15315)) (EmptyCell!4985) )
))
(declare-datatypes ((array!25173 0))(
  ( (array!25174 (arr!12036 (Array (_ BitVec 32) ValueCell!4985)) (size!12388 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25173)

(declare-fun e!247568 () Bool)

(declare-fun array_inv!8776 (array!25173) Bool)

(assert (=> start!39238 (and (array_inv!8776 _values!549) e!247568)))

(declare-fun array_inv!8777 (array!25171) Bool)

(assert (=> start!39238 (array_inv!8777 _keys!709)))

(declare-fun b!414198 () Bool)

(declare-fun res!240788 () Bool)

(assert (=> b!414198 (=> (not res!240788) (not e!247573))))

(assert (=> b!414198 (= res!240788 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12387 _keys!709))))))

(declare-fun v!412 () V!15315)

(declare-fun b!414199 () Bool)

(declare-fun +!1172 (ListLongMap!5899 tuple2!6986) ListLongMap!5899)

(assert (=> b!414199 (= e!247570 (= call!28694 (+!1172 call!28693 (tuple2!6987 k!794 v!412))))))

(declare-fun b!414200 () Bool)

(declare-fun e!247571 () Bool)

(assert (=> b!414200 (= e!247571 (not e!247567))))

(declare-fun res!240789 () Bool)

(assert (=> b!414200 (=> res!240789 e!247567)))

(assert (=> b!414200 (= res!240789 (validKeyInArray!0 (select (arr!12035 _keys!709) from!863)))))

(assert (=> b!414200 e!247570))

(declare-fun c!54971 () Bool)

(assert (=> b!414200 (= c!54971 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15315)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12250 0))(
  ( (Unit!12251) )
))
(declare-fun lt!189938 () Unit!12250)

(declare-fun zeroValue!515 () V!15315)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 (array!25171 array!25173 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) (_ BitVec 64) V!15315 (_ BitVec 32) Int) Unit!12250)

(assert (=> b!414200 (= lt!189938 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414201 () Bool)

(assert (=> b!414201 (= e!247574 e!247571)))

(declare-fun res!240792 () Bool)

(assert (=> b!414201 (=> (not res!240792) (not e!247571))))

(assert (=> b!414201 (= res!240792 (= from!863 i!563))))

(declare-fun lt!189935 () array!25173)

(declare-fun lt!189937 () ListLongMap!5899)

(declare-fun getCurrentListMapNoExtraKeys!1171 (array!25171 array!25173 (_ BitVec 32) (_ BitVec 32) V!15315 V!15315 (_ BitVec 32) Int) ListLongMap!5899)

(assert (=> b!414201 (= lt!189937 (getCurrentListMapNoExtraKeys!1171 lt!189934 lt!189935 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414201 (= lt!189935 (array!25174 (store (arr!12036 _values!549) i!563 (ValueCellFull!4985 v!412)) (size!12388 _values!549)))))

(declare-fun lt!189936 () ListLongMap!5899)

(assert (=> b!414201 (= lt!189936 (getCurrentListMapNoExtraKeys!1171 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414202 () Bool)

(declare-fun res!240799 () Bool)

(assert (=> b!414202 (=> (not res!240799) (not e!247573))))

(assert (=> b!414202 (= res!240799 (or (= (select (arr!12035 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12035 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414203 () Bool)

(assert (=> b!414203 (= e!247573 e!247574)))

(declare-fun res!240794 () Bool)

(assert (=> b!414203 (=> (not res!240794) (not e!247574))))

(assert (=> b!414203 (= res!240794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189934 mask!1025))))

(assert (=> b!414203 (= lt!189934 (array!25172 (store (arr!12035 _keys!709) i!563 k!794) (size!12387 _keys!709)))))

(declare-fun b!414204 () Bool)

(declare-fun res!240790 () Bool)

(assert (=> b!414204 (=> (not res!240790) (not e!247573))))

(assert (=> b!414204 (= res!240790 (and (= (size!12388 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12387 _keys!709) (size!12388 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414205 () Bool)

(declare-fun res!240800 () Bool)

(assert (=> b!414205 (=> (not res!240800) (not e!247573))))

(assert (=> b!414205 (= res!240800 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7006))))

(declare-fun b!414206 () Bool)

(declare-fun e!247572 () Bool)

(assert (=> b!414206 (= e!247572 tp_is_empty!10657)))

(declare-fun b!414207 () Bool)

(declare-fun res!240795 () Bool)

(assert (=> b!414207 (=> (not res!240795) (not e!247573))))

(declare-fun arrayContainsKey!0 (array!25171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414207 (= res!240795 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28690 () Bool)

(assert (=> bm!28690 (= call!28694 (getCurrentListMapNoExtraKeys!1171 (ite c!54971 lt!189934 _keys!709) (ite c!54971 lt!189935 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414208 () Bool)

(declare-fun e!247575 () Bool)

(assert (=> b!414208 (= e!247575 tp_is_empty!10657)))

(declare-fun mapNonEmpty!17607 () Bool)

(declare-fun mapRes!17607 () Bool)

(declare-fun tp!34043 () Bool)

(assert (=> mapNonEmpty!17607 (= mapRes!17607 (and tp!34043 e!247575))))

(declare-fun mapRest!17607 () (Array (_ BitVec 32) ValueCell!4985))

(declare-fun mapValue!17607 () ValueCell!4985)

(declare-fun mapKey!17607 () (_ BitVec 32))

(assert (=> mapNonEmpty!17607 (= (arr!12036 _values!549) (store mapRest!17607 mapKey!17607 mapValue!17607))))

(declare-fun b!414209 () Bool)

(assert (=> b!414209 (= e!247568 (and e!247572 mapRes!17607))))

(declare-fun condMapEmpty!17607 () Bool)

(declare-fun mapDefault!17607 () ValueCell!4985)

